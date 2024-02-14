package router

import (
	"github.com/gin-gonic/gin"
	"github.com/santtuniskanen/workout-tracker/backend/controllers"
)

func AuthRoutes(rg *gin.RouterGroup) {

	auth := rg.Group("/auth")
	auth.POST("/register", controllers.RegisterUser)
}
