import Foundation

let multiple = {(_ a : Int, _ b : Int) -> Int in a * b}
let quotient = {(_ a : Int, _ b : Int) -> Int in a / b}

let (a, b) = {() -> (Int, Int) in
    let line = readLine()!
    let arr = line.split(separator: " ").map{i in Int(i)!}
    return (arr.first!, arr.last!)
}()

print("\(a) * \(b) = \(multiple(a, b))")
print("\(a) / \(b) = \(quotient(a, b))")