package router

import (
	"github.com/gin-gonic/gin"
	"github.com/santtuniskanen/workout-tracker/backend/controllers"
)

func UsersRoutes(rg *gin.RouterGroup) {
	users := rg.Group("/users")

	users.GET("/", controllers.GetUsers)
}
