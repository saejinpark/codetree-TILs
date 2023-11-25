import Foundation

let score = Int(readLine()!)!

var answer = ""

switch score {
    case 0...59:
        answer = "F"
        break
    case 60...69:
        answer = "D"
        break
    case 70...79:
        answer = "C"
        break
    case 80...89:
        answer = "B"
        break
    case 90...100:
        answer = "A"
        break
    default:
        answer = ""
        break
}

print(answer)