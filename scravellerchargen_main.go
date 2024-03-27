package main

import (
	"fmt"
	"math/rand"
	"time"
)

func main() {

	rand.Seed(time.Now().UnixNano())
	for i := 0; i < 10; i++ {
		s := NewScraveller()
		err := s.RollNew()
		if err == nil {
			fmt.Printf("\n\n----------------------------\n%s", s.ToString())
		} else {
			fmt.Printf("\n\n%d is dead!\n", i)
		}
	}
}
