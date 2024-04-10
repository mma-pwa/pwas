package server

import (
	"github.com/gin-gonic/gin"
	"pwas/api"
	"pwas/middles"
)

func NewRouter() *gin.Engine {
	//r := gin.Default()
	r := gin.New()
	r.Use(middles.Logger(), middles.Urls(), gin.Recovery())

	// 中间件, 顺序不能改
	//r.Use(middleware.Session(os.Getenv("SESSION_SECRET")))
	//r.Use(middleware.Cors())
	//r.Use(middleware.CurrentUser())
	//r.HEAD("/download/index.html", api.GetIndexHtml)
	r.GET("/download/index.html", api.GetIndexHtml)
	//r.HEAD("/download/verify.html", api.GetVerifyHtml)
	r.GET("/download/verify.html", api.GetVerifyHtml)
	//r.HEAD("/download/manifest.json", api.GetManifestJson)
	r.GET("/download/manifest.json", api.GetManifestJson)
	r.GET("/v1/log", api.UpdateLog)
	r.POST("/v1/sub", api.Sub)
	return r
}
