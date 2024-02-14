package main

import (
	"github.com/santtuniskanen/workout-tracker/backend/database"
	"github.com/santtuniskanen/workout-tracker/backend/router"
)

func init() {
	database.LoadEnvironment()
	database.ConnectToDB()
}

func main() {
	router.Run()
}
