import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({ Int($0) })
    return temp.count == nums.count ? nums : nil
}

func solution(_ first:Int, _ second:Int) -> String {
    var nums = [first, second]
    for i in 2..<10 {
        nums.append((nums[i - 2] + nums[i - 1]) % 10)
    }
    return nums.map{ String($0) }.joined(separator: " ")
}

func main() {
    if let nums = readNums(), nums.count == 2 {
        let (first, second) =  nums |> { ($0.first!, $0.last!) } 
        print(solution(first, second))
    }
}

main()