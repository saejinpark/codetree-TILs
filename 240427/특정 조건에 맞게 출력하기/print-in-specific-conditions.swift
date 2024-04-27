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

func zeroPivFilter(nums:[Int]) -> [Int] {
    var arr:[Int] = []
    for num in nums {
        if num == 0 { break }
        arr.append(num)
    }
    return arr
}

func _solution(nums:[Int]) -> [Int] {
    return nums.map{ $0 % 2 == 0 ? Int(Float($0) / 2.0) : $0 + 3 }
}

func solution(_ nums:[Int]) -> String {

    return (nums |> zeroPivFilter |> _solution)
                .map{String($0)}
                .joined(separator: " ")
}

func main() {
    if let nums = readNums() {
        print(solution(nums))
    }
}

main()