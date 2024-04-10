package api

import (
	"github.com/gin-gonic/gin"
	"github.com/sirupsen/logrus"
	"net/http"
	"pwas/cache"
	"pwas/model"
	"pwas/query"
	"time"
)

type LogInfo struct {
	Cid    string `json:"cid" form:"cid" binging:"required"`
	Host   string `json:"host" form:"host" binging:"required"`
	Uid    string `json:"uid" form:"uid" binging:"required"`
	Type   string `json:"type" form:"type" binging:"required"`
	Params string `json:"params" form:"params" binging:"required"`
}

func UpdateLog(c *gin.Context) {
	li := &LogInfo{}
	c.ShouldBindQuery(li)
	logrus.Debugf("UpdateLog %+v,agent = %+v", li, c.Request.UserAgent())
	_, isGet := cache.GetAppByPromotionUrl(c.Request.Host)
	//logrus.Debugln(app, isGet)
	if !isGet {
		c.JSON(http.StatusNotFound, "url is not exist")
		return
	}
	if li.Uid == "" || li.Type == "" {
		c.JSON(http.StatusNotFound, "error params")
		return
	}
	go func() {
		err := query.AppUserLoginLog.Create(&model.AppUserLoginLog{
			UserID:       li.Uid,
			Status:       li.Type,
			PromotionURL: c.Request.Host,
			ChannelID:    li.Cid,
			CreatedAt:    time.Time{},
			UpdatedAt:    time.Time{},
		})
		logrus.Debugf("err %+v", err)
	}()

	c.JSON(http.StatusOK, "")
}
