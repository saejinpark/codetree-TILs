import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func solution(str:String) -> String {
    let strArr1 = Array(str).map{String($0)}
    var strArr2 = strArr1[..<strArr1.endIndex]
    for i in 0..<strArr1.count {
        strArr2[i] = strArr2[i] == strArr1[1] ? strArr1[0] : strArr2[i]
    }
    return strArr2.joined(separator: "")
}

func main() {
    if let line = readLine() {
        print(line |> solution)
    }
}

main()