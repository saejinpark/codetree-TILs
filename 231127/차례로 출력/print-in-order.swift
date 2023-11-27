import Foundation

var text = ""

for i in 5...17 {
    text += " " + String(i)
}

print(text[text.index(after: text.startIndex)..<text.endIndex])