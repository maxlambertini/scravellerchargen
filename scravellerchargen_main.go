package main

import (
	"encoding/json"
	"fmt"
	"math/rand"
	"os"
	"strconv"
	"time"
)

func main() {

	numPers := 15
	if len(os.Args) >= 2 {
		var err error
		numPers, err = strconv.Atoi(os.Args[1])
		if err != nil {
			numPers = 15
		}
	}

	ct := NewCrackbrainTables()

	var w []*Scraveller = make([]*Scraveller, 0)

	rand.Seed(time.Now().UnixNano())
	for len(w) < numPers {
		s := NewScraveller()

		xx := rand.Intn(12)
		fmt.Printf("Rolled %d\n", xx)
		if xx < 5 {
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
		}
	}
	encjson, _ := json.MarshalIndent(w, "", "  ")
	f, _ := os.Create("output.json")
	defer f.Close()
	f.Write(encjson)
}
