package main

import (
	"encoding/json"
	"fmt"
	"math/rand"
	"os"
	"time"
)

func main() {

	ct := NewCrackbrainTables()

	var w []*Scraveller = make([]*Scraveller, 0)

	rand.Seed(time.Now().UnixNano())
	for i := 0; i < 40; i++ {
		s := NewScraveller()

		xx := rand.Intn(12)
		fmt.Printf("Rolled %d\n", xx)
		if xx < 7 {
			name, _ := ct.NomeCasuale()
			s.Name = name
			s.Species = "Human"

		} else {
			s.Name = ct.EliteName()
			s.Species = ct.Species()

		}

		err := s.RollNew()
		if err == nil {
			w = append(w, s)
		} else {
			fmt.Printf("\n\n%d is dead!\n", i)
		}
	}
	encjson, _ := json.MarshalIndent(w, "", "  ")
	f, _ := os.Create("output.json")
	defer f.Close()
	f.Write(encjson)
}
