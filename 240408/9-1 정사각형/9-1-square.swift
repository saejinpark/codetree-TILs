import Foundation

let n = Int(readLine()!)!

var baseLine = {
    var num = 9
    return {
        let temp = String(num)
        num -= 1
        if num == 0 {
            num = 9
        }
        return temp
    }
}()

var firstArr:[String] = []

for i in 1...n {
    var secondArr:[String] = []
    for j in 1...n {
        secondArr.append(baseLine())
    }
    firstArr.append(secondArr.joined(separator: ""))
}

let answer = firstArr.joined(separator: "\n")

print(answer)