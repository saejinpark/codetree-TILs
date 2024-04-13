import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func toPairArray(_ arr: [String]) -> [[String]] {
    var result:[[String]] = []
    var temp:[String] = []
    for i in arr {
        temp.append(i)
        if temp.count == 2 {
            result.append(temp)
            temp = []
        }
    }
    result.append(temp)
    return result
}

func pairArrayToSentence(_ arr: [[String]]) -> String {
    return arr.map{
        $0.joined(separator: " / ")
    }.joined(separator: "\n")
}

func genLine(_ first: Int, _ second: Int) -> String {
    return "\(first) * \(second) = \(first * second)"
}

func solution() -> String {
    return (1...19).map{ i in
        var arr:[String] = []
        (1...19).forEach { j in
            arr.append(genLine(i, j))
        }
        return arr |>  toPairArray |> pairArrayToSentence
    }.joined(separator: "\n")
}

func main() {
    print(solution())
}

main()