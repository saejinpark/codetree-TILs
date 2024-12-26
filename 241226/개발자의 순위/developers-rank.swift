import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil}
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    return nums
}

func readNumPair() -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums[0], nums[1])
}

func solution(_ matrix: [[Int]]) -> Int {
    var answer = 0

    for nums in matrix {
        for i in 1...(nums.count - 1) {
            if nums[i - 1] < nums[i] {
                answer += 1
            }
        }
    }

    return answer
}

func main() {
    guard let (k, n) = readNumPair() else { return }
    let matrix = (1...k).compactMap({_ in readNums()})
    print(solution(matrix))
}

main()