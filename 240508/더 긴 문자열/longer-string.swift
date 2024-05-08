import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func solution(component:(String, String)) -> String {
    let (str1, str2) = component
    return str1.count == str2.count
                    ? "same"
                    : str1.count > str2.count
                    ? "\(str1) \(str1.count)"
                    : "\(str2) \(str2.count)"
}

func main() {
    if let line = readLine() {
        let (str1, str2) = line.split(separator: " ").map{String($0)} |> { ($0[0], $0[1]) }
        print((str1, str2) |> solution)
    }
}

main()