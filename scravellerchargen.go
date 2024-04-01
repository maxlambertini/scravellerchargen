package main

import (
	"errors"
	"fmt"
	"math/rand"
	"strings"
)

func Diag() string {
	fmt.Println("Diag")
	return "Diag"
}

var Careers = []string{"Medic", "Scout", "Scientist", "Tech", "Merchant", "Smuggler", "Pirate", "Merc", "Pilot"}
var Perks = []string{"Contact", "Money", "Medium Weapon", "Gadget", "Hideout"}

type Scraveller struct {
	Name              string         `json:"name"`
	Size              int            `json:"size"`
	Species           string         `json:"species"`
	Skills            map[string]int `json:"skills"`
	CurrentProfession string         `json:"currentProfession"`
	Perks             map[string]int `json:"perks"`
	Age               int            `json:"age"`
}

func NewScraveller() *Scraveller {
	s := Scraveller{}
	s.Name = "Scraveller"
	s.Species = "Human"
	s.Skills = make(map[string]int)
	s.Perks = make(map[string]int)
	s.Age = 18
	return &s
}

func GetPerk() string {
	return Perks[rand.Intn(len(Perks))]
}

func GetCareer() string {
	return Careers[rand.Intn(len(Perks))]
}

func D4() int {
	return 1 + rand.Intn(4)
}

func D10Dead() (int, bool) {
	w := rand.Intn(10)
	return w, w == 9
}

func (s *Scraveller) RollNew() error {
	s.Size = 3 + rand.Intn(6)
	rolls := D4() + 1
	s1 := ""
	for i := 0; i < rolls; i++ {
		s.Age += 4 + rand.Intn(6)
		h, dead := D10Dead()
		if !dead {
			if len(s.Skills) < 3 {
				s1 = Careers[h]
			} else {
				fmt.Println("Too many skills...")
				n := rand.Intn(3)
				i := 0
				for k := range s.Skills {
					if i == n {
						s1 = k
						break
					}
				}
			}
			if _, ok := s.Skills[s1]; !ok {
				s.Skills[s1] = 1
			} else {
				s.Skills[s1]++
			}
		} else {
			return errors.New("dead")
		}
	}

	maxvalue := 0
	maxkey := ""
	for key, value := range s.Skills {
		if value > maxvalue {
			maxkey = key
			maxvalue = value
		}
	}
	s.CurrentProfession = maxkey

	perks := 1
	if rolls == 5 {
		perks++
	}
	for i := 0; i < perks; i++ {
		p := GetPerk()
		if _, ok := s.Perks[p]; !ok {
			s.Perks[p] = 1
		} else {
			s.Perks[p]++
		}
	}
	return nil
}

func (s *Scraveller) ToString() string {
	builder := strings.Builder{}

	builder.WriteString(fmt.Sprintf("Name: %s\n", s.Name))
	builder.WriteString(fmt.Sprintf("Species: %s\n", s.Species))
	builder.WriteString(fmt.Sprintf("Size: %d\n", s.Size))
	builder.WriteString(fmt.Sprintf("Age: %d years\n", s.Age))

	builder.WriteString("\n\nSkills\n------\n")
	for k, v := range s.Skills {
		builder.WriteString(fmt.Sprintf("%s:%d\n", k, v))
	}

	builder.WriteString("\n\nPerks\n-----\n")
	for k, v := range s.Perks {
		builder.WriteString(fmt.Sprintf("%s:%d\n", k, v))
	}

	return builder.String()
}
