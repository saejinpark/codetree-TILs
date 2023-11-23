import Foundation

func input() -> String {
    return readLine()!
}

func roundDotTwo(_ num: Float ) -> String {
    return String(format: "%.2f", round(num * 100) / 100)
}

let (c, a, b) = (input(), roundDotTwo(Float(input())!), roundDotTwo(Float(input())!))

print(c)
print(a)
print(b)