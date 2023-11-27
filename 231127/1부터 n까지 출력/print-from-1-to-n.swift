import Foundation

let n = Int(readLine()!)!

var text = ""

for i in 1...n {
    text += " " + String(i)
}

print(text[text.index(after: text.startIndex)..<text.endIndex])