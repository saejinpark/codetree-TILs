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

func readPosAndAlpha() -> (Int, String)? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ").map(String.init)
    if temp.count != 2 { return nil }
    if let index = Int(temp[0]) {
        return (index, temp[1])
    }
    return nil
}

func getLimit(_ arr: [(Int, String)]) -> Int {
    var limit = -1
    for (pos, alpha) in arr {
        if pos > limit {
            limit = pos
        }
    }
    return limit
}

func solution(_ arr: [(Int, String)]) -> Int {
    var answer = 0

    let limit = getLimit(arr)

    var row = Array(repeating: "", count: limit + 1)

    for (pos, alpha) in arr {
        row[pos] = alpha
    }

    for start in 0...(limit - 1) {
        if row[start] == "" {
            continue
        }
        for end in (start + 1)...limit {
            if row[end] == "" {
                continue
            }

            let value = end - start
            if value < answer {
                continue
            }

            var gCount = 0
            var hCount = 0

            for index in start...end {
                if row[index] == "G" {
                    gCount += 1
                }
                if row[index] == "H" {
                    hCount += 1
                }
            }

            if gCount == 0 || hCount == 0 || gCount == hCount {
                answer = value
            }
        }        
    }

    return answer
}

func main() {
    guard let n = readNum() else { return }
    let arr = (1...n).compactMap{_ in readPosAndAlpha()}
    print(solution(arr))
}

main()