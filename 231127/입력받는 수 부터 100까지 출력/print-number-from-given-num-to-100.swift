import Foundation

let n = Int(readLine()!)!

var text = ""

for i in n...100 {
    text += " " + String(i)
}

print(text[text.index(after: text.startIndex)..<text.endIndex])