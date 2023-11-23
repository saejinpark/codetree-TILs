import Foundation

func input() -> String {
    return readLine()!
}

func roundDotTwo(_ num: Float ) -> Float {
    return round(num * 100) / 100
}

let c : String = input()
let a : Float = roundDotTwo(Float(input())!)
let b : Float = roundDotTwo(Float(input())!)

print(c)
print(a)
print(b)