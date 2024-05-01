import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(),
          let num = Int(line) else { return nil }
    return num 
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({ Int($0) })
    return temp.count == nums.count ? nums : nil
}

func solution(_ n:Int, _ nums:[Int]) -> Int {
    var (cnt,lastTwoIndex) = (0, 0)
    for (index, element) in nums.enumerated() {
        if element !=  2 { continue }
        cnt += 1
        lastTwoIndex = index
        if cnt == 3 { break }
    }
    return lastTwoIndex + 1
}

func main() {
    if let n = readNum(), let nums = readNums() {
        print(solution(n, nums))
    }
}

main()