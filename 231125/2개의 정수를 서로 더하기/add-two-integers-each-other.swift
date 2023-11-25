import Foundation

let (a, b) = {
    let line = readLine()!
    let arr = line.split(separator: " ").map{i in Int(i)!}
    return (arr.first!, arr.last!)
}()

var c = a + b

print(c, c + b)