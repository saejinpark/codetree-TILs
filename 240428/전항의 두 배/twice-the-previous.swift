import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function:(T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({ Int($0) })
    return temp.count == nums.count ? nums : nil
}

func answerFormat(answer:[Int]) -> String {
    return answer.map{ String($0) }.joined(separator: " ")
}

func solution(_ first:Int, _ second:Int) -> [Int] {
    var answer = [first, second]
    while answer.count < 10 {
        let currentIndex = answer.count
        answer.append(
            answer[currentIndex - 2] * 2 + answer[currentIndex - 1]
            )
    }
    return answer
}

func main() {
    if let nums = readNums() {
        let (first, second) = nums |> { ($0.first!, $0.last!) }
        let answer = solution(first, second)
        print(answer |> answerFormat)
    } 
}

main()