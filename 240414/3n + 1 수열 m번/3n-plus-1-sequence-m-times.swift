import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readInt() -> Int? {
    guard let line = readLine(), let int = Int(line)
    else { return nil }
    return int
}

func solution(_ n: Int, _ arr: [Int]) -> String {
    func _solution(_ num: Int) -> Int {
        var (count, temp) = (0, num)
        while temp != 1 {
            count += 1
            temp = temp % 2 == 0 ?  Int(temp / 2) : temp * 3 + 1
        }
        return count
    }
    return arr.map{
        String(_solution($0))
    }.joined(separator: "\n")
}

func main() {
    if let T = readInt() {
        let arr = (1...T).map{_ in readInt()!}
        solution(T, arr) |> {print($0)}
    }
}

main()