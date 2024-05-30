import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func isPalindrome(str: String) -> Bool {
    return str == str.split(separator: "").reversed().joined(separator: "")
}

func solution(str: String) -> String {
    return (str |> isPalindrome) ? "Yes" : "No"
}

func main() {
    guard let line = readLine() else { return }
    print(line |> solution)
}

main()