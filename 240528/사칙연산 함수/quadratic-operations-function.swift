import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readInput() -> (Int, String, Int)? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    if temp.count != 3 { return nil }
    guard let num1 = Int(temp[0]), let num2 = Int(temp[2]) else { return nil }
    let op = String(temp[1])
    if !["+", "-", "/", "*"].contains(op) { return nil }
    return (num1, op, num2)
}

func plus(_ num1: Int, _ num2: Int) -> String {
    return "\(num1) + \(num2) = \(num1 + num2)"
}

func minus(_ num1: Int, _ num2: Int) -> String {
    return "\(num1) - \(num2) = \(num1 - num2)"
}

func multiple(_ num1: Int, _ num2: Int) -> String {
    return "\(num1) * \(num2) = \(num1 * num2)"
}

func divide(_ num1: Int, _ num2: Int) -> String {
    return "\(num1) / \(num2) = \(num1 / num2)"
}

func solution(input: (Int, String, Int)) -> String {
    let (num1, op, num2) = input
    switch op {
        case "+":
            return plus(num1, num2)
        case "-":
            return minus(num1, num2)
        case "*":
            return multiple(num1, num2)
        case "/":
            return divide(num1, num2)
        default:
            return ""
    }
}


func main() {
    guard let input = readInput() else { return }
    print(input |> solution)
}

main()