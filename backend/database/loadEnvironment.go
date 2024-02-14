package database

import (
	"log"

	"github.com/joho/godotenv"
)

func LoadEnvironment() {
	err := godotenv.Load()

	if err != nil {
		log.Fatal("Error lodaing .env file!")
	}
}
