import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line)
    else { return nil }
    return num
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap( {Int($0)} )
    return temp.count == nums.count ? nums : nil
}

func solution(_ n:Int, _ nums:[Int]) -> Int {
    if nums.count == 1 {
        return nums[0]
    }
    var sortedNums = nums.sorted(by:>)
    while sortedNums[0] == -1 || sortedNums[0] == sortedNums[1] {
        sortedNums[0] = -1
        sortedNums[1] = -1
        sortedNums = sortedNums.sorted(by: >)
    }
    return sortedNums[0]
}


func main() {
    if let n = readNum(), let nums = readNums() {
        print(solution(n, nums))
    }
}

main()