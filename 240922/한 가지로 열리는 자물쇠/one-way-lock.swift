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

    return (1...n).reduce(0) { outerCount, i in
        outerCount + (1...n).reduce(0) { middleCount, j in 
            middleCount + (1...n).reduce(0) { innerCount, k in
                innerCount + (zip(comb, [i, j, k]).contains { abs($0 - $1) <= 2 } ? 1 : 0)
            }
        }
    }
}

func main() {
    guard let n = readNum(), let comb = readNums() else { return }
    print(solution((n, comb)))
}

main()