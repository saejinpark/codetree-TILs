import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func solution(str:String) -> String {
    let (str1, str2) = str.split(separator: " ") |> {($0[0], $0[1])}
    let str1Arr = Array(str1)
    var str2Arr = Array(str2)
    for i in 0...1 {
        str2Arr[i] = str1Arr[i]
    }
    return str2Arr.map{String($0)}.joined(separator: "")
}

func main() {
    if let line = readLine() {
        print(line |> solution)
    }
}

main()