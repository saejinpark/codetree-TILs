import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U { function(value) }

func readNum() -> Int? {
    return Int((0...0).compactMap({_ in readLine()})[0])
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    return temp.count == nums.count ? nums : nil
}

func solution(component: (Int, [Int])) -> Int {
    let (n, nums) = component
    var answer = Int.min
    for i in 0..<n - 2 {
        for j in (i + 2)..<n {
            answer = [answer, nums[i] + nums[j]].max()!
        }
    }
    return answer
}

func main() {
    guard let n = readNum(), let nums = readNums() else { return }
    print((n, nums) |> solution)
}

main()