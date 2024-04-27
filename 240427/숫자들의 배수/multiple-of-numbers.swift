import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readInt() -> Int? {
    guard let line = readLine(), let integer = Int(line) else { return nil }
    return integer
}

func solution(_ num:Int) -> String {
    var arr:[Int]  = []
    let limit = 2
    var cnt = 0
    var i = 1
    while cnt < limit {
        let testCase = num * i
        i += 1
        arr.append(testCase)
        if testCase % 5 == 0 {
            cnt += 1
        }
    }
    return arr.map{ String($0) }.joined(separator: " ")
}

func main() {
    if let num = readInt() {
        print(solution(num))
    }
}

main()