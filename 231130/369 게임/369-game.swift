import Foundation

let n = Int(readLine()!)!


func test(_ n: Int) -> Bool {
    if n % 3 == 0 {return false}
    for char in String(n) {
        switch char {
            case "3", "6", "9": return false
            default: break; 
        }
    }
    return true
}

func solution(_ n: Int) -> String {
    var arr = [Int]()

    for i in 1...n {
        arr.append(test(i) ? i : 0)
    }
    return arr.map{String($0)}.joined(separator: " ")
}

let answer = solution(n)

print(answer)