package main

import (
	"github.com/santtuniskanen/workout-tracker/backend/database"
	"github.com/santtuniskanen/workout-tracker/backend/models"
)

func init() {
	database.LoadEnvironment()
	database.ConnectToDB()
}

func main() {
	database.DB.AutoMigrate(&models.User{})
}
