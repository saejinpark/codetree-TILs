import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func solution(component:(String, String)) -> Bool {
    let (str1, str2) = component
    return str1 + str2 == str2 + str1
}

func main() {
    if let line1 = readLine(), let line2 = readLine() {
        print((line1, line2) |> solution)
    }
}

main()