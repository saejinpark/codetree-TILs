import Foundation

func solution() -> String { 
    var nums = [String]()
    
    while true {
        let n = readLine()!
        if n == "0" {
            break
        }
        nums.append(n)
    }

    return nums.joined(separator: "\n")
}

let answer = solution()

print(answer)