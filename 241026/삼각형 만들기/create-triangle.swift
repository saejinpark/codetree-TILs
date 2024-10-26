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
    let temp = line.split(separator: " ").map(String.init)
    let nums = temp.compactMap({ Int($0) })
    return temp.count == nums.count ? nums : nil
}

func readNumPair() -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums[0], nums[1])
}

func _solution(p1: (Int, Int), p2: (Int, Int), p3: (Int, Int)) -> Int {
    return abs((p1.0 * p2.1 + p2.0 * p3.1 + p3.0 * p1.1)
    - (p2.0 * p1.1 + p3.0 * p2.1 + p1.0  * p3.1))
}

func solution(_ component: (Int, [(Int, Int)])) -> Int {
    let (n, input) = component

    var answer = 0

    for i in 0...(n - 3) {
        let p1 = input[i]
        for j in (i + 1)...(n - 2) {
            let p2 = input[j]
            for k in (j + 1)...(n - 1) {
                let p3 = input[k]

                if (p1.0 == p2.0 && p1.0 == p3.0 && p2.0 == p3.0)
                || (p1.0 != p2.0 && p1.0 != p3.0 && p2.0 != p3.0){
                    continue
                }
                if (p1.1 == p2.1 && p1.1 == p3.1 && p2.1 == p3.1)
                || (p1.1 != p2.1 && p1.1 != p3.1 && p2.1 != p3.1){
                    continue
                }

                let testCase = _solution(p1: p1, p2: p2, p3: p3)

                answer = max(answer, testCase)

            }
        }
    }

    return answer

}

func main() {
    guard let n = readNum() else { return }
    let input = (1...n).compactMap({_ in readNumPair()})
    print(solution((n, input)))
}

main()