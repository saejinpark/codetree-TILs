import Foundation

func numToAlpha(_ n: Int) -> String? {
    guard let unicode = UnicodeScalar(n)
    else {
        return nil
    }
    return String(unicode)
}

let genUpperAlpha = {
    var baseLine = 65

    return {
        defer {
            baseLine += 1
            if baseLine > 90 {
                baseLine = 65
            }
        }
        return numToAlpha(baseLine)!
    }
}()

func readInt() -> Int? {
    guard let line = readLine(), let int = Int(line)
    else {
        return nil
    }
    return int
}

func solution(_ n: Int) -> String {
    return (1...n).map{ _ in
        (1...n).map{_ in genUpperAlpha()}.reduce(""){$0 + $1}
    }.joined(separator: "\n")
}

func main() {
    if let n = readInt() {
        print(solution(n))
    }
}

main()