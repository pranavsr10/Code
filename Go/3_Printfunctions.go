package main
import "fmt"

func main()  {
 var a int = 9 
 var b string = "God"
 var c bool = true
 var d float32 = 12.9876
 fmt.Print(a)
 fmt.Print("this is not ur power is %T. " , a , "\n")
 fmt.Printf("this is not ur power is %v and %T" , a , b , "\n")
 fmt.Println("Hello" , "hello")
 // ##############################################################################
 fmt.Printf("This is a number %v and its type is %T , the percentage sign is %% and the go syntax format is %#v ." , a , a ,a )
 fmt.Printf("Binary value is %b" , a)
 fmt.Printf("%+d\n", a)
 fmt.Printf("\n")
 // #############################################################################
 fmt.Printf("String Functions\n")
 fmt.Printf("%s\n" , b)
 fmt.Printf("%q \n %8s \n %-8s \n %x \n % x	" , b , b , b ,b ,b)
 fmt.Printf("Bool Functions \n")
 fmt.Printf("This is %t \n" ,c)
 // #############################################################################
 fmt.Printf("Float Functions \n")
 fmt.Printf("%f \n %e \n %3.2f \n %g" , d , d , d , d)
 fmt.Printf("\nOombu da juni")
 fmt.Printf("\nHello")
}

