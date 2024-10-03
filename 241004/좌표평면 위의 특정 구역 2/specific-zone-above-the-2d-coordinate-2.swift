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
    let nums = temp.compactMap({Int($0)})
    return temp.count == nums.count ? nums : nil
}

func readNumPair() -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums.first!, nums.last!)
}

func solution(_ coords: [(Int, Int)]) -> Int {
    var answer = Int.max
    let limit = coords.map{$0.1}.max()!

    for pass in 0..<coords.count {
        var p1 = (Int.max, Int.max)
        var p2 = (Int.min, Int.min)

        for i in 0..<coords.count {
            if i == pass {
                continue
            }

            let (x, y) = coords[i]
            if x < p1.0 {
                p1.0 = x
            }
            if x > p2.0 {
                p2.0 = x
            }
            if y < p1.1 {
                p1.1 = y
            }
            if y > p2.1 {
                p2.1 = y
            }
        }

        let testCase = (p2.0 - p1.0) * (p2.1 - p1.1)
        answer = [answer, testCase].min()!
    }

    return answer
}

func main() {
    guard let n = readNum() else { return }
    let coords = (1...n).compactMap({_ in readNumPair()})
    print(solution(coords))
}


main()