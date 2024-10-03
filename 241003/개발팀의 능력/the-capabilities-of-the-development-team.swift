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
    var minDifference = Int.max
    
    // 모든 가능한 2-2-1 팀 조합을 확인
    for i in 0..<5 {
        for j in 0..<4 {
            for k in (j+1)..<5 {
                if i != j && i != k {
                    let team1 = nums[j] + nums[k]
                    let team2 = nums.enumerated().filter { $0.offset != i && $0.offset != j && $0.offset != k }.map { $0.element }.reduce(0, +)
                    let team3 = nums[i]
                    
                    if team1 != team2 && team2 != team3 && team1 != team3 {
                        let maxSum = max(team1, team2, team3)
                        let minSum = min(team1, team2, team3)
                        let difference = maxSum - minSum
                        minDifference = min(minDifference, difference)
                    }
                }
            }
        }
    }
    
    return minDifference == Int.max ? -1 : minDifference
}

func main() {
    guard let nums = readNums() else { return }
    print(solution(nums: nums))
}

main()