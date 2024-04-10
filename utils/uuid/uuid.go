package uuid

import (
	"crypto/md5"
	"fmt"
	uuid "github.com/satori/go.uuid"
)

func GenerateUUID() string {
	// 将UUID转换为字节切片
	uuidBytes := uuid.NewV4().Bytes()
	hash := md5.Sum(uuidBytes)
	//fmt.Println(fmt.Sprintf("%x", hash))
	return fmt.Sprintf("%x", hash)[7:23]
}
