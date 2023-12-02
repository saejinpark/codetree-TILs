import Foundation

func solution() -> String {
    var respons = [String]()

    while true {
        let n = Int(readLine()!)!
        switch n {
            case 1...24:
                respons.append("Higher")
                break
            case 25:
                respons.append("Good")
                return respons.joined(separator: "\n")
            default:
                respons.append("Lower")
        }
    }
}

let answer = solution()

print(answer)