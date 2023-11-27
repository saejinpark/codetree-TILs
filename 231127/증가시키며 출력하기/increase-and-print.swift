import Foundation

var answer = ""

for i in stride(from: 5, to:18, by: 2) {
    answer += " \(i)"
}

print(answer[answer.index(after: answer.startIndex)..<answer.endIndex])