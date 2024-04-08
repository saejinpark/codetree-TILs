import Foundation

let n = Int(readLine()!)!

var num = 1

var answerArr:[String] = []

for i in 1...n {
    var lineArr:[String] = []
    for j in 1...n {
        lineArr.append(String(num))
        num += 1
        if num == 10 {
            num = 1
        }
    }
    answerArr.append(lineArr.joined(separator: ""))
}

print(answerArr.joined(separator: "\n"))