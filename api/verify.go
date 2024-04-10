package api

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"pwas/cache"
)

func GetVerifyHtml(c *gin.Context) {
	q := &ParamsQuery{}
	c.BindQuery(q)
	app, isGet := cache.GetAppByPromotionUrl(c.Request.Host)
	//logrus.Debugln(app, isGet)
	if !isGet {
		c.JSON(http.StatusNotFound, "url is not exist")
		return
	}
	c.Header("Cache-Control", "public, max-age=14400")
	gh := gin.H{"channelId": q.Cid, "appId": app.ID, "app_url": app.AppURL, "isIframe": app.Iframe}
	c.HTML(http.StatusOK, "verify.html", gh)
}
