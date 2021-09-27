package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"sort"
	"strconv"
	"strings"
)

type byGeneratonsCnt []string

func (s byGeneratonsCnt) Len() int {
	return len(s)
}

func (s byGeneratonsCnt) Swap(i, j int) {
	s[i], s[j] = s[j], s[i]
}

func (s byGeneratonsCnt) Less(i, j int) bool {
	name_i := strings.Split(s[i], "___")
	genCnt_i, _ := strconv.Atoi(name_i[len(name_i)-1])

	name_j := strings.Split(s[j], "___")
	genCnt_j, _ := strconv.Atoi(name_j[len(name_j)-1])
	return genCnt_i > genCnt_j
}

func gameHandler(w http.ResponseWriter, r *http.Request) {
	file, _ := ioutil.ReadFile("../frontend/index.html")
	fmt.Fprint(w, string(file))
}

func canvasHandler(w http.ResponseWriter, r *http.Request) {
	file, _ := ioutil.ReadFile("../frontend/canvas.js")
	fmt.Fprint(w, string(file))
}

func gameOfLifeHandler(w http.ResponseWriter, r *http.Request) {
	file, _ := ioutil.ReadFile("../frontend/game_of_life.js")
	fmt.Fprint(w, string(file))
}

func getGenerationList() []string {

	fmt.Println("HEY...")
	var filenames []string
	infos, _ := ioutil.ReadDir(storageDir)
	//fmt.Println(infos)
	for _, info := range infos {
		filenames = append(filenames, info.Name())
	}
	sort.Sort(byGeneratonsCnt(filenames))
	//sort.Reverse(filenames)
	return filenames
}

type gameType [][][]int

var generationsList []string

func getGameDataHandler(w http.ResponseWriter, r *http.Request) {

	lastGame := generationsList[0]
	// handle out of slice error
	// Бесконечно перезапрашиваем лист, нужно добавить логики
	if len(generationsList) > 0 {
		generationsList = generationsList[1:]
	} else {
		generationsList = getGenerationList()
	}

	//fmt.Println(lastGame)
	gameData, _ := ioutil.ReadFile(storageDir + lastGame)

	//fmt.Println(gameData)
	var game gameType
	if err := json.Unmarshal(gameData, &game); err != nil {
		panic(err)
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(game)

}

var storageDir = "../storage/"

func main() {
	// fmt.Println(getGenerationList())
	generationsList = getGenerationList()
	http.HandleFunc("/game/canvas.js", canvasHandler)
	http.HandleFunc("/game/game_of_life.js", gameOfLifeHandler)
	http.HandleFunc("/game/", gameHandler)
	http.HandleFunc("/get_game_data/", getGameDataHandler)

	log.Fatal(http.ListenAndServe(":8888", nil))

}
