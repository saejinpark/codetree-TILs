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

func sumNums(_ nums:[Int]) -> Int {
    return nums.reduce(0, +)
}

func oddIndexFilter(_ nums:[Int]) -> [Int] {
    return nums
            .enumerated()
            .filter{ (index, _) in index % 2 == 0 }
            .map{ (_, element) in element}
}

func evenIndexFilter(_ nums:[Int]) -> [Int] {
    return nums
            .enumerated()
            .filter{ (index, _) in index % 2 == 1 }
            .map{ (_, element) in element }
}

func solution(_ nums:[Int]) -> Int {
    let sumOdd = nums |> oddIndexFilter |> sumNums
    let sumEven = nums |> evenIndexFilter |> sumNums

    return sumOdd > sumEven ? sumOdd - sumEven : sumEven - sumOdd
}

func main() {
    if let nums = readNums() {
        print(solution(nums))
    }
}

main()