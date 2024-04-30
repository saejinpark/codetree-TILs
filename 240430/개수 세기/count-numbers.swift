import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function:(T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({ Int($0) })
    return temp.count == nums.count ? nums : nil
}


func solution(_ n:Int, _ m:Int, _ nums:[Int]) -> Int {
    return nums.filter{$0 == m}.count
}

func main() {
    guard let temp = readNums() else { return }
    if temp.count != 2 { return }
    let (n, m) = temp |> { ($0.first!, $0.last!) }
    if let nums = readNums() {
        print(solution(n, m, nums))
    }
}

main()