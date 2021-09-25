package main

import (
	"bufio"
	"fmt"
	"game_of_life/pkg/my.com/me/myproject/mypackage"
	"game_of_life/pkg/storage"
	"hello"
	"log"
	"os"
	"strconv"
	"strings"
	test1 "test1/test11"

	greeting "github.com/headfirstgo/greeting"
	//greeting "game_of_life/pkg/greeting"
)

// grade, err := strconv.ParseFloat(())

func getFloat() (float64, error) {
	mypackage.MyFunc()
	greeting.Hello()
	filenames, _ := storage.GetAllGenerationFilenames()
	for _, filename := range filenames {
		fmt.Println(filename)
	}
	reader := bufio.NewReader(os.Stdin)
	input, err := reader.ReadString('\n')
	if err != nil {
		return 0, err
	}
	input = strings.TrimSpace(input)
	number, err := strconv.ParseFloat(input, 64)
	if err != nil {
		return 0, err
	}
	return number, nil
}
func main() {

	hello.Hey()
	test1.Test1()
	fmt.Println("Enter a grade:")
	grade, err := getFloat()
	if err != nil {
		log.Fatal(err)
		return
	}

	var status string
	if grade >= 60 {
		status = "passing"
	} else {
		status = "failing"
	}

	fmt.Println("A grade of", grade, "is", status)
}
