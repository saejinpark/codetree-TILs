import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({ Int($0) })
    return temp.count == nums.count ? nums : nil
}

func solution(numsArr:[[Int]]) -> String {
    return numsArr
            .map{ String($0.reduce(0, +)) }
            .joined(separator: "\n")
}

func main() {
    let numsArr = (1...4).compactMap({_ in readNums() })
    if numsArr.count == 4 {
        print(numsArr |> solution)
    }
}

main()