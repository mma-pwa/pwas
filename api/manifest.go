package api

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/goccy/go-json"
	"net/http"
	"pwas/cache"
)

func GetManifestJson(c *gin.Context) {
	q := &ParamsQuery{}
	c.BindQuery(q)
	app, isGet := cache.GetAppByPromotionUrl(c.Request.Host)
	//logrus.Debugln(app, isGet)
	if !isGet {
		c.JSON(http.StatusNotFound, "url is not exist")
		return
	}
	c.Header("Cache-Control", "public, max-age=14400")
	icons := new([]ImgInfo)
	err := json.Unmarshal([]byte(app.Icons), icons)
	if err != nil {
		c.String(http.StatusOK, err.Error())
		return
	}
	appIcons := make([]Icon, 0)
	for _, icon := range *icons {
		appIcons = append(appIcons, Icon{
			Src:   icon.Url,
			Sizes: fmt.Sprintf("%vx%v", icon.Width, icon.Height),
			Type:  fmt.Sprintf("image/%v", icon.ImgType),
		})
	}
	c.JSON(http.StatusOK, &Manifest{
		ID:              fmt.Sprintf("/download/verify.html"),
		Scope:           "/download",
		Name:            app.Name,
		Display:         "standalone",
		StartURL:        fmt.Sprintf("/download/verify.html"),
		ShortName:       app.Name + " " + app.ShortName,
		ThemeColor:      "#ffffff",
		Description:     app.Description,
		BackgroundColor: "#ffffff",
		Orientation:     "any",
		Categories:      []string{"photo", "productivity", "utilities"},
		RelatedApplications: []RelatedApplication{
			{
				Platform: "webapp",
				URL:      fmt.Sprintf("https://%s/download/manifest.json", c.Request.Host),
			},
		},
		Icons:       appIcons,
		Screenshots: make([]Screenshot, 0),
	})
}

// Manifest 定义顶层结构体
type Manifest struct {
	ID                  string               `json:"id"`
	Scope               string               `json:"scope"`
	Name                string               `json:"name"`
	Display             string               `json:"display"`
	StartURL            string               `json:"start_url"`
	ShortName           string               `json:"short_name"`
	ThemeColor          string               `json:"theme_color"`
	Description         string               `json:"description"`
	Orientation         string               `json:"orientation"`
	BackgroundColor     string               `json:"background_color"`
	Categories          []string             `json:"categories"`
	RelatedApplications []RelatedApplication `json:"related_applications"`
	Icons               []Icon               `json:"icons"`
	Screenshots         []Screenshot         `json:"screenshots"`
}

// RelatedApplication 定义关联应用结构体
type RelatedApplication struct {
	Platform string `json:"platform"`
	URL      string `json:"url"`
}

// Icon 定义图标结构体
type Icon struct {
	Src     string `json:"src"`
	Sizes   string `json:"sizes"`
	Type    string `json:"type"`
	Purpose string `json:"purpose"`
}

// Screenshot 定义截图结构体
type Screenshot struct {
	Src        string `json:"src"`
	Sizes      string `json:"sizes"`
	FormFactor string `json:"form_factor"`
	Label      string `json:"label"`
	Type       string `json:"type"`
}
