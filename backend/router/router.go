package router

import "github.com/gin-gonic/gin"

var r = gin.Default()

func Run() {
	Routes()
	r.Run()
}

func Routes() {
	api := r.Group("/api")
	{
		AuthRoutes(api)
	}
}
