import Foundation

let score = Int(readLine()!)!

var answer = ""

switch score {
    case 0...60:
        answer = "F"
        break
    case 61...70:
        answer = "D"
        break
    case 71...80:
        answer = "C"
        break
    case 81...90:
        answer = "B"
        break
    case 91...100:
        answer = "A"
        break
    default:
        answer = ""
        break
}

print(answer)