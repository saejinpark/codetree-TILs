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
    let nums = temp.compactMap({Int($0)})
    if temp.count != nums.count {
        return nil
    }
    return nums
}

func solution(_ nums:[Int]) -> String {
    var arr:[Int] = []

    for i in 0..<10 {
        if nums[i] == 0 {
            break
        }
        arr.append(nums[i])
    }
    arr.reverse()

    return arr
            |> { $0.map{ String($0) } }
            |> { $0.joined(separator: " ") }
}

func main() {
    if let nums = readNums() {
        print(solution(nums))
    }
}

main()