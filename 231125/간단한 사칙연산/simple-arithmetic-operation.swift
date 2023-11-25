import Foundation

let (a, b) = {() -> (Int, Int) in
    let line = readLine()!
    let arr = line.split(separator: " ").map{i in Int(i)!}
    return (arr.first!, arr.last!)  
}()

let add = {(_ a: Int, _ b: Int) -> Int in return a + b}
let dec = {(_ a: Int, _ b: Int) -> Int in return a - b}
let div = {(_ a: Int, _ b: Int) -> Int in return a / b}
let rem = {(_ a: Int, _ b: Int) -> Int in return a % b}

print(add(a, b))
print(dec(a, b))
print(div(a, b))
print(rem(a, b))