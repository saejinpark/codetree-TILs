import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNumAndStr() -> (Int, String)? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    if temp.count != 2 { return nil }
    guard let num = Int(temp[0]) else { return nil }
    return (num, String(temp[1]))
}

func solution(input: (Int, String)) -> Int {
    let (n, A) = input
    var cnt = 0
    var strs = (1...n).compactMap({_ in readLine()})
    for str in strs {
        if A == str {
            cnt += 1
        }
    }
    return cnt
}

func main() {
    guard let input = readNumAndStr() else { return }
    print(input |> solution)
}

main()