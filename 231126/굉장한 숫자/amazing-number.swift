import Foundation

let n = Int(readLine()!)!

func test1(_ num : Int) -> Bool {
    return num % 2 == 1 && num >= 3 && num % 3 == 0
}

func test2(_ num : Int) -> Bool {
    return num % 2 == 0 && num >= 5 && num % 5 == 0
}

print(test1(n) || test2(n) ? "true" : "false")