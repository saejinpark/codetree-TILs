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

func solution(nums:[Int]) -> String {
    var underNums:[Int] = []
    var overNums:[Int] = []
    for num in nums {
        if num == 500 { continue }
        if num < 500 {
            underNums.append(num)
        } else {
            overNums.append(num)
        }
    }
    return "\(underNums.max()!) \(overNums.min()!)"
}

func main() {
    if let nums = readNums() {
        print(nums |> solution)
    }
}

main()