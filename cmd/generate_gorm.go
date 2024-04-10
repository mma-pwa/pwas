package main

import (
	"github.com/joho/godotenv"
	"gorm.io/driver/mysql"
	"gorm.io/gen"
	"gorm.io/gorm"
	"os"
)

func main() {
	godotenv.Load("../server.env")
	db, err := gorm.Open(mysql.Open(os.Getenv("MYSQL_DSN")), &gorm.Config{})
	if err != nil {
		return
	}
	g := gen.NewGenerator(gen.Config{
		OutPath: "../query",
		Mode:    gen.WithoutContext | gen.WithDefaultQuery | gen.WithQueryInterface, // generate mode
	})
	g.UseDB(db)
	//
	g.ApplyBasic(
		g.GenerateModel("app"),
		g.GenerateModel("app_user_login_log"),
		g.GenerateModel("app_custom_url"),
		g.GenerateModel("app_sub_user"),
		g.GenerateModel("user"),
	)
	g.Execute()
}
