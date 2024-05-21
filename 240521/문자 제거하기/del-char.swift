import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func solution(str:String) -> String {
    var answer:[String] = []
    var strArr = Array(str).map{String($0)}

    while (strArr.count != 1) {
        guard let line = readLine(), let index = Int(line) else { return "Error" }
        let limit = strArr.count
        strArr.remove(at: index < limit ? index : limit - 1)
        answer.append(strArr.joined(separator:""))
    }

    return answer.joined(separator: "\n")
}

func main() {
    if let line = readLine() {
        print(line |> solution)
    }
}

main()