import Foundation

let (a, b) = {() -> (Int, Int) in
    let line = readLine()!
    let arr = line.split(separator: " ").map{i in Int(i)!}
    return (arr.first!, arr.last!)
}()

let quotient = {(_ a : Int, _ b : Int) -> Int in return a / b}
let multiple = {(_ a : Int, _ b : Int) -> Int in return a % b}

print("\(quotient(a, b))...\(multiple(a, b))")