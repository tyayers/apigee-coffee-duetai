package main

import (
	"log"
	"net/http"
	"time"

	"github.com/gin-contrib/static"
	"github.com/gin-gonic/gin"
)

type CoffeeBean struct {
	Id     string `json:"id"`
	Name   string `json:"name"`
	Origin string `json:"origin"`
	Roast  string `json:"roast"`
	Flavor string `json:"flavor"`
	Price  int64  `json:"price"`
}

type PurchaseOrder struct {
	ID           string `json:"id"`
	CreatedAt    string `json:"createdAt"`
	UpdatedAt    string `json:"updatedAt"`
	Status       string `json:"status"`
	CustomerId   string `json:"customerId"`
	CoffeeBeanId string `json:"coffeeBeanId"`
	Quantity     int64  `json:"quantity"`
	UnitPrice    int64  `json:"unitPrice"`
	TotalPrice   int64  `json:"totalPrice"`
	Tax          int64  `json:"tax"`
}

var beanCollection []CoffeeBean = []CoffeeBean{
	{
		Id:     "1",
		Name:   "Arabica",
		Origin: "Ethiopia",
		Roast:  "Light",
		Flavor: "Sweet",
		Price:  10000,
	},
	{
		Id:     "2",
		Name:   "Robusta",
		Origin: "Indonesia",
		Roast:  "Medium",
		Flavor: "Sweet",
		Price:  12000,
	},
}

var purchaseOrdersCollection []PurchaseOrder = []PurchaseOrder{}

func main() {

	r := gin.Default()

	r.Use(static.Serve("/", static.LocalFile("./public", true)))

	r.GET("/coffee-beans", func(c *gin.Context) {
		c.IndentedJSON(http.StatusCreated, beanCollection)
	})

	r.GET("/purchase-orders", func(c *gin.Context) {
		c.IndentedJSON(http.StatusCreated, purchaseOrdersCollection)
	})

	r.POST("/purchase-orders", func(c *gin.Context) {
		var newPurchaseOrder PurchaseOrder // Call BindJSON to deserialize
		newDate := time.Now()

		newPurchaseOrder.Tax = computeTax(newPurchaseOrder.TotalPrice)
		newPurchaseOrder.TotalPrice = newPurchaseOrder.TotalPrice + newPurchaseOrder.Tax
		newPurchaseOrder.CreatedAt = newDate.Format(time.RFC3339)
		newPurchaseOrder.UpdatedAt = newDate.Format(time.RFC3339)
		newPurchaseOrder.Status = "Pending"

		if err := c.BindJSON(&newPurchaseOrder); err != nil {
			log.Println(err)
			return
		}

		purchaseOrdersCollection = append(purchaseOrdersCollection, newPurchaseOrder)

		// Return newly created post
		c.IndentedJSON(http.StatusCreated, newPurchaseOrder)
	})

	r.Run(":8080")
}

func computeTax(price int64) int64 {
	return price * 10 / 100
}
