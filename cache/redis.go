package cache

import (
	"context"
	"fmt"
	"github.com/go-co-op/gocron/v2"
	"github.com/redis/go-redis/v9"
	"github.com/sirupsen/logrus"
	"pwas/model"
	"pwas/query"
	"sync"
	"time"
)

var client *redis.Client

var appInfos = &sync.Map{}
var appUrlID = &sync.Map{}
var userInfos = &sync.Map{}

func loadCache() {
	//client = redis.NewClient(&redis.Options{Addr: os.Getenv("REDIS_ADDR"), Password: os.Getenv("REDIS_PW"), DB: 0})
	apps, err := query.App.WithContext(context.Background()).Find()
	if err != nil {
		logrus.Errorf("get app infos err %v", apps)
		return
	}
	logrus.Infof("get app infos len %v", len(apps))
	for _, app := range apps {
		//logrus.Infof("add app %v,info %+v", app.PromotionURL, app)
		appInfos.Store(app.ID, app)
		appUrlID.Store(app.PromotionURL, app.ID)
	}
	appCustomURL, err := query.AppCustomURL.Find()
	if err != nil {
		logrus.Errorf("get AppCustomURL err %v", apps)
		return
	}
	logrus.Infof("get appCustomURLs len %v", len(appCustomURL))
	for _, url := range appCustomURL {
		appUrlID.Store(url.CustomURL, url.AppID)
	}
	users, err := query.User.Find()
	if err != nil {
		logrus.Errorf("get users err %v", apps)
	}
	logrus.Infof("get users len %v", len(users))
	for _, user := range users {
		userInfos.Store(user.ID, user)
	}
}

func LoadCacheScheduler() {
	loadCache()
	s, err := gocron.NewScheduler()
	if err != nil {
		fmt.Sprintf("err %v", err)
	}
	j, err := s.NewJob(
		gocron.DurationJob(
			time.Minute*5,
		),
		gocron.NewTask(
			loadCache,
		),
	)
	s.Start()
	if err != nil {
		fmt.Println("start scheduler err ", err, j.ID())
	}
}

func GetAppByPromotionUrl(promotionUrl string) (*model.App, bool) {
	if vo, ok := appUrlID.Load(promotionUrl); ok {
		if v, ok := appInfos.Load(vo); ok {
			if vv, ok := v.(*model.App); ok {
				return vv, true
			}
		}
	}
	return nil, false
}

// GetUserInfoByUserID userID is acc id.
func GetUserInfoByUserID(userID string) (*model.User, bool) {
	if v, ok := userInfos.Load(userID); ok {
		if vv, ok := v.(*model.User); ok {
			return vv, true
		}
	}
	return nil, false
}
