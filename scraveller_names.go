package main

import (
	"fmt"
	"math/rand"
	"os"
	"path/filepath"
	"strings"
	"time"
)

func GetExecutablePath() string {
	ex, err := os.Executable()
	if err != nil {
		panic(err)
	}
	exPath := filepath.Dir(ex)
	return exPath
}

type CrackbrainTables struct {
	Seed int64
	rnd  rand.Source
}

func NewCrackbrainTables() *CrackbrainTables {
	seed := time.Now().UnixNano()
	return &CrackbrainTables{Seed: seed, rnd: rand.NewSource(seed)}
}

func TextFileToArray(filename string) []string {
	fmt.Println("Loading data file: ", filename)
	content, err := os.ReadFile(filename)
	if err != nil {
		panic(fmt.Sprintf("Error reading %s", filename))
	}
	lines := strings.Split(string(content), "\n")
	for i, s := range lines {
		lines[i] = strings.TrimSpace(s)
	}
	return lines
}

var NomiFemminili = TextFileToArray(fmt.Sprintf("%s/data/names_f.txt", GetExecutablePath()))
var NomiMaschili = TextFileToArray(fmt.Sprintf("%s/data/names_m.txt", GetExecutablePath()))
var Cognomi = TextFileToArray(fmt.Sprintf("%s/data/surnames.txt", GetExecutablePath()))
var EliteNames = TextFileToArray(fmt.Sprintf("%s/data/elite.txt", GetExecutablePath()))
var Species = TextFileToArray(fmt.Sprintf("%s/data/species.txt", GetExecutablePath()))

func (t *CrackbrainTables) GetRandomItem(data []string) string {
	l := len(data)
	idx := t.rnd.Int63() % int64(l)
	return data[idx]
}

func (t *CrackbrainTables) BasicEliteName() string {
	return strings.Title(t.GetRandomItem(EliteNames))
}

func (t *CrackbrainTables) NomeFemminile() string {
	return t.GetRandomItem(NomiFemminili)
}

func (t *CrackbrainTables) NomeMaschile() string {
	return t.GetRandomItem(NomiMaschili)
}

func (t *CrackbrainTables) Species() string {
	return t.GetRandomItem(Species)
}

func (t *CrackbrainTables) Cognome() string {
	return t.GetRandomItem(Cognomi)
}

func (t *CrackbrainTables) NomeCompleto(femmina bool) (string, string) {
	if femmina {
		return t.NomeFemminile() + " " + t.Cognome(), "F"
	} else {
		return t.NomeMaschile() + " " + t.Cognome(), "M"
	}
}

var MASKS = []string{
	"%s",
	"%s %s",
	"%s %s",
	"%s %s",
	"%s %s",
	"%s %s",
	"%s-%s",
	"%s-%s",
	"%s %s",
	"%s-%s %s",
	"%s %s %s",
}

func (t *CrackbrainTables) EliteName() string {
	w := t.rnd.Int63() % 11
	if w == 0 {
		return fmt.Sprintf(MASKS[int(w)], t.BasicEliteName())
	} else {
		if w < 9 {
			return fmt.Sprintf(MASKS[int(w)], t.BasicEliteName(), t.BasicEliteName())

		} else {
			return fmt.Sprintf(MASKS[int(w)], t.BasicEliteName(), t.BasicEliteName(), t.BasicEliteName())
		}
	}
}

func (t *CrackbrainTables) NomeCasuale() (string, string) {
	idx := t.rnd.Int63() % 100
	return t.NomeCompleto(idx < 53)
}
