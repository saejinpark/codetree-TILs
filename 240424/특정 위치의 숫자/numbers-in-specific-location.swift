import Foundation

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({ Int($0) })
    return nums
}


func solution(_ nums:[Int]) -> Int {
    var answer = 0
    for i in [2, 4, 9] {
        answer += nums[i]
    }
    return answer
}

func main() {
    if let nums = readNums() {
        print(solution(nums))
    }
}

main()