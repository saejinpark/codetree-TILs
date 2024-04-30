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
    let nums = temp.compactMap({Int($0)})
    return temp.count == nums.count ? nums : nil
}

func solution(_ a:Int, _ b:Int) -> Int {
    var counter:[Int:Int] = [:]
    var current = a
    while current != 0 {
        counter[current % b, default: 0] += 1
        current = current / b
    }
    return  counter.values.map{ $0 * $0 }.reduce(0, +)
}

func main() {
    if let temp = readNums() {
        let (a, b) = temp |> { ($0.first!, $0.last!) }
        print(solution(a, b))
    }
}

main()