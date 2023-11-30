import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> String {
    var arr = [Int]()

    for i in 1...n {
        if i % 3 == 0 {
            arr.append(0)
            continue
        }
        var testCase = true
        for char in String(i) {
            switch char {
                case "3", "6", "9":
                    testCase = false
                    break;
                default:
                    break; 
            }
            if !testCase {
                break
            }
        }
        arr.append(testCase ? i : 0)
    }
    return arr.map{String($0)}.joined(separator: " ")
}

let answer = solution(n)

print(answer)