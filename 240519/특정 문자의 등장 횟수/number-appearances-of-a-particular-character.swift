import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func counter(component:(String, String)) -> Int {
    let (line, base) = component
    let answer = line.split(separator: base).count - 1
    if answer == 0 {
        return line.contains(base) ? 1 : 0
    }
    return answer
}

func solution(line:String) -> String {
    return "\((line, "ee") |> counter) \((line, "eb") |> counter)"
}

func main() {
    if let line = readLine() {
        print(line |> solution)
    }
}

main()