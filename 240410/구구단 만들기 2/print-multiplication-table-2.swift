import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readInput() -> (Int, Int)? {
    guard let input = readLine() else {
        print("No input provided.")
        return nil
    }
    
    let integers = input.split(separator: " ").compactMap { Int($0) }
    
    guard integers.count == 2 else {
        print("Invalid input. Please enter two integers separated by space.")
        return nil
    }
    
    return (integers[0], integers[1])
}

if let (a, b) = readInput() {
    let answer = [2, 4, 6, 8].map{ second in
        var lines = (a...b).map{ first in
            "\(first) * \(second) = \(first * second)"
        }
        lines.reverse()
        return lines.joined(separator: " / ")
    }.joined(separator: "\n")

    print(answer)
}