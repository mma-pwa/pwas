package api

import (
	"github.com/gin-gonic/gin"
	"github.com/goccy/go-json"
	"github.com/sirupsen/logrus"
	"net/http"
	"pwas/cache"
	"strconv"
	"strings"
)

type ParamsQuery struct {
	Cid string `json:"cid" form:"cid" binging:"required"`
}

func GetIndexHtml(c *gin.Context) {
	logrus.Debugln("do", c.Request.Host)
	q := &ParamsQuery{}
	c.BindQuery(q)
	//hosts := strings.Split(c.Request.Host, ".")
	//if len(hosts) != 3 {
	//	return
	//}
	app, isGet := cache.GetAppByPromotionUrl(c.Request.Host)
	//logrus.Debugln(app, isGet)
	if !isGet {
		c.JSON(http.StatusNotFound, "url is not exist")
		return
	}
	user, isGet := cache.GetUserInfoByUserID(app.UserID)
	if !isGet {
		c.JSON(http.StatusNotFound, "no acc")
		return
	}
	logrus.Infof("user is %+v", user)
	if !user.Utype && user.Money <= 0 {
		c.JSON(http.StatusNotFound, "pls recharge")
		return
	}
	c.Header("Cache-Control", "public, max-age=300")
	rateReviewCount := ""
	if app.AppRateCount < 1000 {
		rateReviewCount = strconv.FormatInt(app.AppRateCount, 10)
	} else if app.AppRateCount < 1000000 {
		rateReviewCount = strconv.FormatInt(app.AppRateCount/1000, 10) + "K"
	} else {
		rateReviewCount = strconv.FormatInt(app.AppRateCount/1000000, 10) + "M"
	}
	appInstallCount := ""
	if app.AppInstallCount < 1000 {
		appInstallCount = strconv.FormatInt(app.AppInstallCount, 10)
	} else if app.AppInstallCount < 1000000 {
		appInstallCount = strconv.FormatInt(app.AppInstallCount/1000, 10) + "K+"
	} else {
		appInstallCount = strconv.FormatInt(app.AppInstallCount/1000000, 10) + "M+"
	}
	ageImgUrl := "https://img.quicka2b.com/18a.webp"
	//icons := make([]ImgInfo, 0)
	icons := new([]ImgInfo)
	json.Unmarshal([]byte(app.Icons), icons)
	screens := new([]ImgInfo)
	json.Unmarshal([]byte(app.AppScreen), screens)
	//logrus.Debugln(icons)
	//logrus.Debugln(screens)
	appDescriptions := strings.Split(app.AppDescription, "\n")
	data := gin.H{
		"appId":           app.ID,
		"appIcon":         (*icons)[0].Url,
		"app_name":        app.Name,
		"dev_name":        app.AppDevName,
		"app_short_name":  app.ShortName,
		"rate_num":        app.AppRateNum,
		"rate_view_count": rateReviewCount,
		"appInstallCount": appInstallCount,
		"ageImgUrl":       ageImgUrl,
		"screens":         *screens,
		//"appDescription":   app.AppDescription,
		"appDescription":   appDescriptions,
		"channelId":        q.Cid,
		"any_site_install": app.AnySiteInstall,
	}
	c.HTML(http.StatusOK, "index.html", data)
}

type ImgInfo struct {
	Url     string `json:"url"`
	Width   int    `json:"width"`
	Height  int    `json:"height"`
	ImgType string `json:"img_type"`
}
