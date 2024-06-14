import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

typealias ShakeHandLog = (Int, Int, Int)

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if temp.count != nums.count { return nil }
    return nums
}

func readNKPT() -> (Int, Int, Int, Int)? {
    guard let nums = readNums(), nums.count == 4 else { return nil }
    return (nums[0], nums[1], nums[2], nums[3])
}

func readShakeHandLog() -> ShakeHandLog? {
    guard let nums = readNums(), nums.count == 3 else { return nil }
    return (nums[0], nums[1], nums[2])
}

func solution(input: (Int, Int, Int, Int, [ShakeHandLog])) -> String {
    let (N, K, P, T, logs) = input
    var users = Array(repeating: (false, 0), count: N + 1)
    let sortedLogs = logs.sorted{$0.0 < $1.0}
    users[P] = (true, K)
    for (_, x, y) in sortedLogs {
        if users[x].0 && users[y].0 {
            users[x].1 = users[x].1 > 0 ? users[x].1 - 1 : 0 
            users[x].1 = users[y].1 > 0 ? users[y].1 - 1 : 0
        } else if users[x].0 && !users[y].0 && users[x].1 > 0 {
            users[x].1 -= 1
            users[y].0 = true
            users[y].1 = K
        } else if !users[x].0 && users[y].0 && users[y].1 > 0 {
            users[y].1 -= 1
            users[x].0 = true
            users[x].1 = K
        }
    }
    users.remove(at: 0)
    return users.map{$0.0 ? "1" : "0"}.joined(separator: "")
}

func main() {
    guard let (N, K, P, T) = readNKPT() else { return }
    let logs = (1...T).compactMap({_ in readShakeHandLog()})
    print((N, K, P, T, logs) |> solution)
}

main()