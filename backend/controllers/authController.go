package controllers

import (
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/santtuniskanen/workout-tracker/backend/database"
	"github.com/santtuniskanen/workout-tracker/backend/models"
)

// Register a new user
func RegisterUser(c *gin.Context) {
	var newUser models.User
	if err := c.ShouldBindJSON(&newUser); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// Validating input data, like the email
	// with proper response when the email
	// account is already in use
	if err := database.DB.Create(&newUser).Error; err != nil {
		if strings.Contains(err.Error(), "duplicate key value violates unique constraint") {
			c.JSON(400, gin.H{"error": "Email address is already in use"})
			return
		}
		c.JSON(500, gin.H{"error": "Failed to create user"})
		return
	}

	// Return the new user data as JSON response
	c.JSON(201, gin.H{"user": newUser})
}
