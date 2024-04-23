import Foundation

precedencegroup FowardPipe {
    associativity : left
}

infix operator |> : FowardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
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
    var sum = 0
    var cnt = 0

    for i in nums {
        if i == 0 { break }
        sum += i
        cnt += 1
    }

    var avg = round(Float(sum) / Float(cnt) * 10) / 10

    return "\(sum) \(avg)"
}

func main(){
    if let nums = readNums() {
        print(solution(nums))
    }
}

main()