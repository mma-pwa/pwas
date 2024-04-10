package api

import (
	"fmt"
	"github.com/SherClockHolmes/webpush-go"
	"github.com/gin-gonic/gin"
	"github.com/goccy/go-json"
	"net/http"
	"pwas/cache"
	"pwas/model"
	"pwas/query"
	"time"
)

type SubInfoReq struct {
	Uid     string  `json:"uid"`
	SubInfo SubInfo `json:"subInfo"`
}

type SubInfo struct {
	Endpoint       string `json:"endpoint"`
	ExpirationTime string `json:"expirationTime"`
	Keys           struct {
		P256Dh string `json:"p256dh"`
		Auth   string `json:"auth"`
	} `json:"keys"`
}

func Sub(c *gin.Context) {
	q := &SubInfoReq{}
	err := c.BindJSON(q)
	app, ok := cache.GetAppByPromotionUrl(c.Request.Host)
	if !ok {
		c.JSON(http.StatusNotFound, `{"err":"no host"}`)
		return
	}
	fmt.Println(err, q)
	if err != nil {
		c.JSON(http.StatusNotFound, `{"err":"arg err"}`)
		return
	}
	subInfoBytes, _ := json.Marshal(q.SubInfo)
	query.AppSubUser.Create(&model.AppSubUser{
		AppID:     app.ID,
		UserID:    q.Uid,
		SubInfo:   string(subInfoBytes),
		CreatedAt: time.Time{},
		UpdatedAt: time.Time{},
	})
	go func() {
		message := []byte(`{"title":"Hi","body":"welcome game","icon":"https://img.quicka2b.com/icon_1.webp"}`)
		resp, err := webpush.SendNotification(message, &webpush.Subscription{
			Endpoint: q.SubInfo.Endpoint,
			Keys:     webpush.Keys{Auth: q.SubInfo.Keys.Auth, P256dh: q.SubInfo.Keys.P256Dh},
		}, &webpush.Options{
			Subscriber:      "test@gmail.com",
			VAPIDPublicKey:  "BKIP6_vTWo30xqEOaNcLGysuY_6LwmY6e28_Fq5xGhlcGzbvf4raT9qTSn8MCajY_RJwSw1uBuHl0pMRO2EDg6w",
			VAPIDPrivateKey: "Oh3rtjfqWCLpQf9YYZvIKSH0oq0WItZJhRqwSMLsA5U",
			TTL:             30,
		})
		defer resp.Body.Close()
		fmt.Println("push ====== ", err)
		if err == nil {
			fmt.Println("push =======", resp.Status)
		}
	}()
	c.JSON(http.StatusOK, `{"err":""}`)
}
