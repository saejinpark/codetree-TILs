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

func solution(_ nums:[Int]) -> Int {
    var piv = -1
    
    for i in 0..<nums.count {
        if nums[i] % 3 == 0 {
            piv = i
            break
        }
    }

    return nums[piv - 1]
}

func main() {
    if let nums = readNums() {
        print(solution(nums))
    }
}

main()