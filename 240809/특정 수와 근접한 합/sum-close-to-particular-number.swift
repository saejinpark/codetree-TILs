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
    return temp.count == nums.count ? nums : nil
}

func readNumPair() -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums[0], nums[1])
}

func solution(component: (Int, Int, [Int])) -> Int {
    let (n, s, nums) = component
    var answer = Int.max

    for i in 0..<n {
        for j in (i + 1)..<n {
            let testCase = abs(
                    s - nums.enumerated().filter{ (index, _) in
                    index != i && index != j
                }.map{(_, num) in num}
                .reduce(0, +)
            )

            answer = testCase < answer ? testCase : answer
        }
    }
    return answer
}

func main() {
    guard let (n, s) = readNumPair(), let nums = readNums() else { return }
    print((n, s, nums) |> solution)

}

main()