import Foundation

let a = Float(readLine()!.replacingOccurrences(of: " ", with: ""))!
let b = Float(readLine()!)!

switch (a, b) {
    case let (left, right) where left >= 1.0 && right >= 1.0:
        print("High")
        break
    case let (left, right) where left >= 0.5 && right >= 0.5:
        print("Middle")
        break
    default:
        print("Low")
}