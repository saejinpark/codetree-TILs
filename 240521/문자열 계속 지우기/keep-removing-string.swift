import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func solution(component:(String, String)) -> String {
    let (str, base) = component
    var strArr = str.split(separator: base).map{String($0)}
    while strArr.count > 1 {
        strArr = strArr.joined(separator: "").split(separator: base).map{String($0)}
    }
    return strArr.count > 0 ? strArr[0] : ""
}

func main() {
    if let line1 = readLine(), let line2 = readLine() {
        print((line1, line2) |> solution)
    }
}

main()