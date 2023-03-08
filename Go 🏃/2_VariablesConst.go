package main
import "fmt"
// var a int = 89 
const a int = 89
const (
  PI = 3.14
)
  func main()  {
  // var a int
  a := 8
  var b float32 = 17.890
  var c string = "hwello"
  var d = true
  var e bool
  var f int
  var g string
  var x , y , z string = "hello" , "my" , "Name"
  h , i := "is" , "Knightfall"
  var (
    num1 int = 3
    str1 string = "hello"
  )
  // PI = 30
  fmt.Println(num1,str1)
  fmt.Println(e , f , g)
  fmt.Println(a)
  fmt.Println(b)
  fmt.Println(c)
  fmt.Println(d)
  fmt.Println(x , y , z , h , i)
}

