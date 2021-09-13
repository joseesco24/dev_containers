package main

import (
	"fmt"
	pka "main/hello_world"
	pkb "main/structs"
)

func main() {

	pka.HelloWorld()

	var car pkb.Car

	car.Brand = "Hyundai"
	car.Year = 2018

	fmt.Println(car)

}
