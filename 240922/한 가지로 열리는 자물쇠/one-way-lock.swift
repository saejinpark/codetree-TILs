import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ").map(String.init)
    let nums = temp.compactMap{Int($0)}
    return temp.count == nums.count ? nums : nil
}

func solution(_ component: (Int, [Int])) -> Int {
    let (n, comb) = component
    var count = 0
    for i in 1...n {
        for j in 1...n {
            for k in 1...n {
                let testCase = [i, j, k]
                for (first, second) in zip(comb, testCase) {
                    if abs(first - second) <= 2 {
                        count += 1
                        break
                    } 
                }
            }
        }
    }

    return count
}

func main() {
    guard let n = readNum(), let comb = readNums() else { return }
    print(solution((n, comb)))
}

main()