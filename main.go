package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	"os"
	"pwas/cache"
	"pwas/config"
	"pwas/server"
)

func main() {

	//fmt.Println(privateKey, publicKey)
	//Oh3rtjfqWCLpQf9YYZvIKSH0oq0WItZJhRqwSMLsA5U
	//BKIP6_vTWo30xqEOaNcLGysuY_6LwmY6e28_Fq5xGhlcGzbvf4raT9qTSn8MCajY_RJwSw1uBuHl0pMRO2EDg6w
	godotenv.Load("server.env")
	config.Init()
	cache.LoadCacheScheduler()
	//icons, _ := json.Marshal([]ImgInfo{{
	//	Url:    "https://play-lh.googleusercontent.com/YEaIZCgWkLa3mi3CcMXdACUy1rCizINWbRc7WP8pBInaJEERfg6PQsgwfWVUPKs85AE=w240-h480-rw",
	//	Height: 480,
	//	Width:  480,
	//}})
	//screens, _ := json.Marshal([]ImgInfo{{
	//	Url:    "https://play-lh.googleusercontent.com/vUhyEx1Ka3zmuuZGokExlynE0_SqHDg1DeYXzNODIa1mM5_CJzBu9hHWVrd1ZYYd-0Y=w526-h296-rw",
	//	Height: 512,
	//	Width:  512,
	//}, {
	//	Url: "https://play-lh.googleusercontent.com/1L2-DG0vC9F76RDup2OXc_jlg8XQNPznpVL2oj-oAvAV-UTj2ZVFKqpHO3FYHzWuDEM=w526-h296-rw",
	//}, {
	//	Url: "https://play-lh.googleusercontent.com/csRaKB5sQZZAVU8l2kjiS8L3ogxxYTBQYCERRbds3pbCOFmUl6fhz1_d-pU_V4v-PzQ=w526-h296-rw",
	//}, {
	//	Url: "https://play-lh.googleusercontent.com/1L2-DG0vC9F76RDup2OXc_jlg8XQNPznpVL2oj-oAvAV-UTj2ZVFKqpHO3FYHzWuDEM=w526-h296-rw",
	//}})
	//err := query.App.WithContext(context.Background()).Create(&model.App{
	//	ID:                uuid.GenerateUUID(),
	//	UserID:            uuid.GenerateUUID(),
	//	Name:              "Slots Myth - Slot Machines",
	//	ShortName:         "Slot Machines",
	//	Description:       "Try your luck, play the BEST casino slot machines games without internet for FREE!",
	//	Icons:             string(icons),
	//	AppURL:            "https://brrbet0.com",
	//	AppDevName:        "Casino Joy",
	//	AppRateNum:        5,
	//	AppRateCount:      99999999,
	//	AppInstallCount:   99999999,
	//	AppSafeAge:        18,
	//	AppScreen:         string(screens),
	//	AppDescription:    "Try your luck, play the BEST casino slot machines games without internet for FREE!\n\nExperience a luxury classic Greek Myth themed casino slots game right now!\n\n💰20,000,000 free coins for new players and more FREE bonus coins daily, what are you waiting for?\n\nEasy to play:\n★ Spin and then BIG WIN, MEGA WIN, SUPER WIN!\n★ Win huge welcome bonus everyday for free!\n★ Offline game, tons of fun!\n\nSlots Features:\n★ $20,000,000 welcome chips: start easily with this amazing casino slot machines!\n★ Daily bonus wheel and hourly Bonuses: continuous free chips!\n★ Big wins and super wins: win and become rich easily with this casino slot machines game!\n★ Double up your wins: double up your slots wins every time by playing extra poker game!\n★ Tons of high quality slots: exciting slot machines with exclusive bonus games!\n★ Massive JACKPOTS and huge PAYOUTS: give you real Las Vegas casino feeling!\n★ Discover unique SLOTS: tons of slot machines to play and more slot machines are coming in free updates!\n★ Play offline: no internet required, play anywhere and anytime!\n\nSlots - Free Vegas Casino Slot Machines Games is absolutely FREE. You can claim FREE BONUS every hour, so that you can enjoy our slot games anytime!\n\nSlots - Free Vegas Casino Slot Machines Games is intended for an adult audience and does not offer real money gambling or an opportunity to win real money or prizes. Practice or success at social gaming does not imply future success at real money gambling.\n\nEnjoy this FREE slot machines casino game! If you have any question or suggestion, please send us email: slotmachines@puzzlejoy.com.\n\nThank you everyone who played Slots - Free Vegas Casino Slot Machines Games!\n\nAre you ready to become billionaire in this Slots game world?",
	//	Status:            false,
	//	ScreenOrientation: false,
	//	PromotionURL:      "slot.w2a.xyz",
	//	CreatedAt:         time.Time{},
	//	UpdatedAt:         time.Time{},
	//})
	//if err != nil {
	//	fmt.Println(err)
	//	return
	//}
	gin.SetMode(os.Getenv("GIN_MODE"))
	r := server.NewRouter()
	r.Static("/download/assets", "./gl/assets")
	r.Static("/download/css", "./gl/css")
	r.Static("/download/js", "./gl/js")
	r.Static("/img", "/opt/nginx")
	r.StaticFile("/sw.js", "./gl/js/sw.js")
	r.StaticFile("/firebase-messaging-sw.js", "./gl/js/firebase-messaging-sw.js")
	r.StaticFile("/favicon.ico", "./gl/assets/icons/favicon.ico")
	r.LoadHTMLGlob("./gl/templates/*")
	r.Run(fmt.Sprintf(":%s", os.Getenv("SERVER_PORT")))
}
