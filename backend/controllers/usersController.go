package controllers

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/santtuniskanen/workout-tracker/backend/database"
	"github.com/santtuniskanen/workout-tracker/backend/models"
)

func GetUsers(c *gin.Context) {
	var users []models.User
	database.DB.Find(&users)

	c.JSON(http.StatusOK, gin.H{
		"users": users,
	})
}
