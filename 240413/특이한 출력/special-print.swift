import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func input() -> Int? {
    guard let line = readLine(), let result = Int(line)
    else {
        return nil
    }
    return result
}

func solution(_ n: Int) -> String {
    var arr:[String] = []
    var temp:[String] = []
    var i = 0
    var j = 0
    for i in 1...n {
        for j in 1...n {
            let testCase = i + j
            temp.append("(\(i), \(j))")
            if testCase % 4 == 0 {
                arr.append(
                    temp.joined(separator: " ")
                )
                temp = []
            }
        }
    }
    if temp.count > 0 {
        arr.append(temp.joined(separator: " "))
    }
    return arr.joined(separator: "\n")
}

func main() {
    if let n = input() {
        print(solution(n))
    }
}

main()