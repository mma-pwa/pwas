package middles

import (
	"github.com/gin-gonic/gin"
	"github.com/sirupsen/logrus"
	"net/http"
	"pwas/cache"
)

func Urls() gin.HandlerFunc {

	return func(c *gin.Context) {
		//fmt.Println("middles url ", c.Request.Proto, c.Request.URL.Scheme)
		_, ok := cache.GetAppByPromotionUrl(c.Request.Host)
		if !ok {
			//c.AbortWithError(http.StatusNotFound, errors.New("no host"))
			logrus.Errorf("middles url no host err %v,url %v", c.Request.Host, c.Request.URL)
			c.AbortWithStatusJSON(http.StatusNotFound, `{"err":"no host"}`)
			return
		} else {
			c.Next()
		}
	}
}
