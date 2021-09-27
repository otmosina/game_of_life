package storage

func GetAllGenerationFilenames() ([]string, error) {
	var filenames []string
	filenames = append(filenames, "first")
	filenames = append(filenames, "second")
	return filenames, nil
}
