//COMMENTO UNA LINEA
/*
 * COMMENTO
 * MULTILINEA
 */

//PACKAGE
package main

//IMPORT
import (
  "fmt"
  "errors"
  "math"
)

//MAIN
func main()  {

  //VARIABILI
  var x int
  x = 5
  y := 7

  //COSTANTI
  const PI float64 = 3.1415926

  //LISTE
  var a [5]int
  a := [5]int{5, 4, 3, 2, 1}
  b := []int{5, 4, 3, 2, 1}
  b = append(b, 13)

  //STAMPARE
  fmt.Println("ciau")

  //IF; ELSE; ELSE IF
  if x < 6 {
    fmt.Println("x < 6")
  } else if x > 6 {
    fmt.Println("x > 6")
  } else {
    fmt.Println("x = 6")
  }


  //SWITCH
  i := 2
    fmt.Print("Write ", i, " as ")
    switch i {
      case 1:
        fmt.Println("one")
      case 2:
        fmt.Println("two")
      case 3:
        fmt.Println("three")
      default:
        fmt.Println("other num")

    }

  //DIZIONARIO
  vertices := make(map[string]int)
  vertices["triangolo"] = 3
  vertices["quadrato"] = 4
  vertices["pentagono"] = 5
  delete(vertices["pentagono"])

  //LOOPS
  j := 0
  for j < 5 {
    fmt.Println(j)
    j++
  }
  for i := 0; i < 5; i++ {
    fmt.Println(i)
  }
  arr := make(map[string]string)
  arr["a"] = "alpha"
  arr["b"] = "beta"
  for key, value := range arr {
    fmt.Println("key", key, "value", value)
  }

  //DA GUARDARE DOPO.

  //STRUCT
  p := person{name: "Carlo", age: 23}

  //PUNTATORI
  i := 7
  a := &i         // & --> adress
  fmt.Println(a)
  fmt.Println(*a) // * --> pointer
}

//FUNZIONI

func sum(x int, y int) int {
  return x + y
}

func sqrt(x float64) (float64, error) {
  if x < 0 {
    return 0, errors.New("Niente numeri negativi nell mia radice quadrata cristiana.")
  }

  //NIL CORRISPONDE A NULL
  return math.Sqrt(x), nil
}

//STRUCT
type person struct {
  name string
  age int
}
