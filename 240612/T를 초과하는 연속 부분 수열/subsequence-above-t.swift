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
    if temp.count != nums.count { return nil }
    return nums
}

func readNAndT()  -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums[0], nums[1])
}

func solution(input: (Int, Int, [Int])) -> Int {
    let (N, T, nums) = input
    var maxCount = 0
    for i in 0..<N {
        if N - i < maxCount {
            break
        }
        var count = 0
        for j in i..<N {
            if nums[j] > T {
                count += 1
                continue
            }
            break
        }
        maxCount = count > maxCount ? count : maxCount
    }

    return maxCount
}

func main() {
    guard let (n, t) = readNAndT(),
    let nums = readNums(),
    nums.count == n
    else { return }
    print((n, t, nums) |> solution)
}

main()