import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func solution(str:String, base: String) -> Int {
    return str.split(separator: "").filter{$0 == base}.count
}

func main() {
    if let str = readLine(), let base = readLine() {
        print((str, base) |> solution)
    }
}

main()