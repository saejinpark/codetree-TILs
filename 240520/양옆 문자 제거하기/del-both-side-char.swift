import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func solution(str:String) -> String {
    var strArr = Array(str).map{String($0)}
    strArr[1] = ""
    strArr[strArr.count - 2] = ""
    return strArr.joined(separator: "")
}

func main() {
    if let line = readLine() {
        print(line |> solution)
    }
}

main()