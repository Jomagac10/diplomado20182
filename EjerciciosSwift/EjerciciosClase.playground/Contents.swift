//: Playground - noun: a place where people can play

import UIKit

//: ## Ejercicio 1

func NumPrimo (_ numb: Int) -> Bool{
    if numb<=1 {
        return false
    }
    for i in 2..<numb{
        if numb%i == 0{
            return false
        }
    }
    return true
}

NumPrimo(9)

//: ## Ejercicio 2

func Fibonacci(_ num: Int){
    var x: Int=0, y:Int=1 , i:Int=0
    while i < num{
        if NumPrimo(y){
            print(y)
        }
        let _TempX = x
        x=y
        y=_TempX+y
        i+=1
    }
}
print("Numeros primos en la secuencia de fibonacci:")
Fibonacci(10)

//: ## Ejercicio 3

func Palindromo(_ cadena: String) -> Bool{
    return cadena.elementsEqual(String(cadena.reversed())) ? true : false
}

Palindromo("anitalavalatina")

//: ## Ejercicio 4

func Comparar (_ str1: String, _ str2: String) -> Bool{
    str1.sorted()
    if str1.elementsEqual(str2.sorted()){
        return true
    }else{
        return false
    }
}

Comparar("abc", "bca")






