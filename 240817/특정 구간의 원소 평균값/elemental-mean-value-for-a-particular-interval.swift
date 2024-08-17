import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    return temp.count == nums.count ? nums : nil
}

func solution(component: (Int, [Int])) -> Int {
    let (n, nums) = component
    var answer = 0
    for i in 1...n {
        for j in i...n {
            let testCase = ((j - i)..<j).map{nums[$0]}
            let sum = testCase.reduce(0, +)
            let avg = Float(sum) / Float(i)
            let decimal = avg.rounded()
            if avg != decimal {
                continue
            }
            if testCase.contains(Int(avg)) {
                answer += 1
            } 
            
        }
    }
    return answer
}

func main() {
    guard let n = readNum(), let nums = readNums(), nums.count == n else { return }
    print((n, nums) |> solution)
}

main()