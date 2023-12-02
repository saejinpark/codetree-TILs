import Foundation

func solution() -> String {
    var respons = [String]()

    let dict = ["John", "Tom", "Paul", "Sam"]

    while true {
        let n = Int(readLine()!.trimmingCharacters(in: [" "]))! - 1
        switch n {
            case 0...3:
                respons.append(dict[n])
                break
            default:
                respons.append("Vacancy")
                return respons.joined(separator: "\n")
        }
    }
    return ""
}

let answer = solution()

print(answer)