import Foundation

let n = Int(readLine()!)!

var answer = (0..<n).map{
    let s = $0 * n + 1
    var arr = Array(s..<s + n).map{String($0)}
    if $0 % 2 == 1 {
        arr.reverse()
    }
    return arr.joined(separator: " ")
}.joined(separator: "\n")

print(answer)