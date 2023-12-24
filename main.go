package main

import (
	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/logger"
)

func main() {
	app := fiber.New()
	app.Use(logger.New())

	app.Get("/v1/stuff", func(c *fiber.Ctx) error {
		c.Set("Content-Type", "application/json")
		return c.SendString("[]")
	})

	app.Listen(":3000")
}
