import Foundation

let n = Int(readLine()!)!

var baseLine = 2

var arr1:[String] = []

for i in 1...n {
    var arr2:[String] = []

    for j in 1...n {
        arr2.append(String(baseLine))
        baseLine += 2
        if baseLine == 10 {
            baseLine = 2
        }
    }

    arr1.append(arr2.joined(separator: " "))
}

let answer = arr1.joined(separator: "\n")

print(answer)