import Foundation

func solution() -> String {
    var respons = [String]()
    var cnt = 0
    while cnt < 3 {
        cnt += 1
        let n = Int(readLine()!.trimmingCharacters(in: [" "]))! 
        switch n {
            case let _n where _n % 2 == 0:
                respons.append(String(_n / 2))
                break
            default:
                cnt -= 1
        }
    }

    return respons.joined(separator: "\n")
}

let answer = solution()

print(answer)