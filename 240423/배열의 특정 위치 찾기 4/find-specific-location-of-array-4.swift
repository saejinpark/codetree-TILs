import Foundation

precedencegroup FowardPipe {
    associativity: left
}

infix operator |> : FowardPipe

func |> <T, U> ( value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({ Int($0) })
    if temp.count != nums.count {
        return nil
    }
    return nums
}

func solution(_ nums: [Int]) -> String {
    var cnt = 0
    var sum = 0
    for i in nums {
        if i == 0 {
            break
        }
        if i % 2 == 0 {
            cnt += 1
            sum += i
        }
    }
    return "\(cnt) \(sum)"
}

func main() {
    if let nums = readNums() {
        print(solution(nums))
    }
}

main()