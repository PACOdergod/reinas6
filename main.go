package main

import "fmt"

func main() {
	cantidad_cols_fils := 4
	// cantidad_fils := 4

	total_casillas := [][]int{
		{1, 1}, {1, 2}, {1, 3}, {1, 4},
		{2, 1}, {2, 2}, {2, 3}, {2, 4},
		{3, 1}, {3, 2}, {3, 3}, {3, 4},
		{4, 1}, {4, 2}, {4, 3}, {4, 4},
	}

	// fmt.Println(cantidad_cols_fils)
	// fmt.Println(cantidad_fils)

	// fmt.Println(total_casillas)

	// mandar a llamar la funcion que analizara
	// las casillas en el orden que defina
	analizar(total_casillas, cantidad_cols_fils)
}

func analizar(casillas [][]int, tamaño int) {
	// de la lista de casillas tomare la primera
	// esa sera donde pondre la reina
	// y del resto calculare las casillas ocupadas
	reina := casillas[0]
	fmt.Printf("reina: %v", reina)

	casillas = append(casillas[1:])

	for _, c := range casillas {
		fmt.Println(c)
	}
}
