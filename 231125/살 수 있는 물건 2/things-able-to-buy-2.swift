import Foundation

let money = Int(readLine()!)!

switch money {
    case let _money where _money >= 3000:
        print("book")
        break
    case let _money where _money >= 1000:
        print("mask")
        break
    case let _money where _money >= 500:
        print("pen")
        break
    default:
        print("no")
}