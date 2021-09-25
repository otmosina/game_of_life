package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
)

type Page struct {
	Title string
	Body  []byte
}

func (p *Page) save() error {
	filename := p.Title + ".txt"
	return ioutil.WriteFile(filename, p.Body, 0600)
}

func loadPage(title string) (*Page, error) {
	filename := title
	body, err := ioutil.ReadFile(filename)
	if err != nil {
		return nil, err
	}
	return &Page{Title: title, Body: body}, err
}

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hey, place for %s", r.URL.Path[1:])
}

func h1(text string) string {
	return "<h1>" + text + "</h1><br>"

}

func viewHandler(w http.ResponseWriter, r *http.Request) {
	title := r.URL.Path[len("/view/"):]
	fmt.Println(string(title))
	page, _ := loadPage(string(title))
	fullPage := h1(string(page.Title)) + string(page.Body)
	fmt.Fprint(w, fullPage)
}

func main() {
	p1 := &Page{Title: "Game of life", Body: []byte("Here html is located")}
	p1.save()
	p2, _ := loadPage("Game of life")
	fullPage := string(p2.Title) + string(p2.Body)
	fmt.Println(fullPage)

	http.HandleFunc("/view/", viewHandler)
	http.HandleFunc("/", handler)

	log.Fatal(http.ListenAndServe(":8080", nil))
}
