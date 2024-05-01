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
    var useNums:[Int] = []
    for num in nums {
        if num == -999 || num == 999 {
            break
        }
        useNums.append(num)
    }
    return "\(useNums.max()!) \(useNums.min()!)"
}

func main() {
    if let nums = readNums() {
        print(nums |> solution)
    }
}

main()