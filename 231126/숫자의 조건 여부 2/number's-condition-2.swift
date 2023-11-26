import Foundation

let a = Int(readLine()!)!

switch a {
    case 5:
        print("A")
        break
    case let _a where _a % 2 == 0:
        print("B")
        break
    default:
        break
}