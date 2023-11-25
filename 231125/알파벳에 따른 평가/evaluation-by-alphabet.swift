import Foundation

let char = readLine()!

switch char {
    case "S":
        print("Superior")
        break
    case "A":
        print("Excellent")
        break
    case "B":
        print("Good")
        break
    case "C":
        print("Usually")
        break
    case "D":
        print("Effort")
        break
    default:
        print("Failure ")
}