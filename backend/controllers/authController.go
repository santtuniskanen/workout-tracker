package controllers

import (
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v5"
	"github.com/santtuniskanen/workout-tracker/backend/database"
	"github.com/santtuniskanen/workout-tracker/backend/models"
	"golang.org/x/crypto/bcrypt"
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

// User Login
func LoginUser(c *gin.Context) {
	var credentials models.User
	if err := c.ShouldBindJSON(&credentials); err != nil {
		c.JSON(400, gin.H{"error": "Invalid email or password!"})
		return
	}

	// Authenticate User (validation)
	var existingUser models.User
	if err := database.DB.Where("email = ?", credentials.Email).First(&existingUser).Error; err != nil {
		c.JSON(401, gin.H{"error": "Invalid email or password!"})
		return
	}

	// Verify Password
	if err := bcrypt.CompareHashAndPassword([]byte(existingUser.Password), []byte(credentials.Password)); err != nil {
		c.JSON(401, gin.H{"error": "Invalid email or password!"})
		return
	}

	// Generate JWT
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"userId": existingUser.ID,
	})

	tokenString, err := token.SignedString([]byte("your-secret-key"))
	if err != nil {
		c.JSON(500, gin.H{"error": "Failed to generate token!"})
		return
	}

	// Return Token to the client
	c.JSON(200, gin.H{"token": tokenString})
}
