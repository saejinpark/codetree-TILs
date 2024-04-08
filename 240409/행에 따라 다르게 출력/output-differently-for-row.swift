import Foundation

let n = Int(readLine()!)!

var num = 0

let getNum = {
    num = $0 % 2 == 0 ? num + 1 : num + 2
    return String(num)
}

var grid:[String] = []

for i in 0..<n {
    var nums:[String] = []
    for _ in 1...n {
        nums.append(getNum(i))
    }
    grid.append(
        nums.joined(separator: " ")
    )
}

let answer = grid.joined(separator: "\n")

print(answer)