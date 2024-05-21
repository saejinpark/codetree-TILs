import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func solution(str:String) -> String {
    var strArr = Array(str).map(String.init)
    for i in 0..<strArr.count {
        if strArr[i] == "e" {
            strArr.remove(at: i)
            break
        }
    }
    return strArr.joined(separator: "")
}

func main() {
    if let line = readLine() {
        print(line |> solution)
    }
}

main()