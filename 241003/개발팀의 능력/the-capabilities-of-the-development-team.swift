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
    let temp = line.split(separator: " ").map(String.init)
    let nums = temp.compactMap{ Int($0) }
    return temp.count == nums.count ? nums : nil
}

func solution(nums: [Int]) -> Int {
    var sum = nums.reduce(0, +)
    var minDifference = Int.max

    for i in 0...4 {
        for j in 0...4 {
            for k in 0...4 {
                if i != j && j != k && i != k {
                    let team1 = nums[i] + nums[j]
                    let team2 = nums[k]
                    let team3 = sum - team1 - team2
                    if team1 != team2 && team2 != team3 && team1 != team3 {
                        let sortedTeams = [team1, team2, team3].sorted(by: <)
                        minDifference = [minDifference, sortedTeams.last! - sortedTeams.first!].min()!
                    }
                }
            }
        }
    }

    if minDifference == Int.max {
        return -1
    }

    return minDifference
}

func main() {
    guard let nums = readNums() else { return }
    print(solution(nums: nums))
}

main()