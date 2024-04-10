package config

import (
	"fmt"
	"github.com/sirupsen/logrus"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"os"
	"pwas/query"
)

func Init() {
	fmt.Println(os.Getenv("MYSQL_DSN"))
	db, err := gorm.Open(mysql.Open(os.Getenv("MYSQL_DSN")), &gorm.Config{})
	if err != nil {
		return
	}
	query.SetDefault(db)
	//if os.Getenv("GEN_MODE") == "true" {
	//	g := gen.NewGenerator(gen.Config{
	//		OutPath: "./query",
	//		Mode:    gen.WithoutContext | gen.WithDefaultQuery | gen.WithQueryInterface, // generate mode
	//	})
	//	g.UseDB(db)
	//	//
	//	g.ApplyBasic(
	//		g.GenerateModel("app"),
	//		g.GenerateModel("app_user_login_log"),
	//		g.GenerateModel("app_custom_url"),
	//		g.GenerateModel("app_sub_user"),
	//	)
	//	g.Execute()
	//}
	//logrus.SetFormatter(&logrus.JSONFormatter{})
	logrus.SetReportCaller(true)
	logrus.SetOutput(os.Stdout)
	logrus.SetLevel(logrus.TraceLevel)
}
