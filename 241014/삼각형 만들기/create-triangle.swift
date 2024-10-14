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

func readNumPair() -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums[0], nums[1])
}

func solution(_ input: [(Int, Int)]) -> Int {
    
    var answer = Int.min

    for i in 0..<(input.count - 2) {

        let p1 = input[0]

        for j in (i + 1)..<(input.count - 1) {

            let p2 = input[1]
            
            for k in (i + 2)..<input.count {
                
                let p3 = input[2]
            
                if p1.0 != p2.0 && p2.0 != p3.0 && p1.0 != p3.0 {
                    continue
                }

                if p1.0 == p2.0 && p2.0 == p3.0 && p1.0 == p3.0 {
                    continue
                }
                
                if p1.1 != p2.1 && p2.1 != p3.1 && p1.1 != p3.1 {
                    continue
                }

                if p1.1 == p2.1 && p2.1 == p3.1 && p1.1 == p3.1 {
                    continue
                }

                let l = [p1, p2, p3].map{ $0.0 }.min()!
                let r = [p1, p2, p3].map{ $0.0 }.max()!
                let t = [p1, p2, p3].map{ $0.1 }.max()!
                let b = [p1, p2, p3].map{ $0.1 }.min()!

                let testCase = (r - l) * (t - b) * 2

                answer = max(answer, testCase)

            }
        }
    }
    
    return answer
}

func main() {
    guard let n = readNum() else { return }
    let input = (1...n).compactMap({ _ in readNumPair() })
    print(solution(input))
}

main()