import Foundation

precedencegroup FowardPipe {
    associativity: left
}

infix operator |> : FowardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func input() -> Int? {
    guard let line = readLine(), let num = Int(line)
    else {
        return nil
    }
    return num
}

func genLine(_ arr: [Int]) -> String {
    return arr.map{String($0)}.joined(separator: " ")
}

func sollution(_ n: Int) -> String {
    let arr = Array(1...n)
    return stride(from: n - 1, to: -1, by: -1).map{
        genLine(Array(arr[$0..<arr.count]))
    }.joined(separator: "\n")
}


func main() {
    if let n = input() {
        print(sollution(n))
    }
}

main()