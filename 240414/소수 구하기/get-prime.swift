import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readInt() -> Int? {
    guard let line = readLine(), let int = Int(line)
    else { return nil }
    return int
}

func solution(_ n: Int) -> String {
    var numDict = Dictionary(uniqueKeysWithValues: (2...100).map { ($0, true) })
    for i in (2...100) {
        for j in stride(from: 2 * i, to: 101, by: i) {
            numDict[j] = false
        }
    }

    return (2...n).filter{ numDict[$0] == true }.map{ String($0) }.joined(separator: " ")
}

func main() {
    if let n = readInt() {
        print(solution(n))
    }
}

main()