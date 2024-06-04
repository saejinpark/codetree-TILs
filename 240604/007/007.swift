import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readInput() -> (String, String, Int)? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ").map(String.init)
    guard temp.count == 3, let time = Int(temp[2]) else { return nil}
    return (temp[0], temp[1], time)
}

func solution(input: (String, String, Int)) -> String {
    let (code, point, time) = input
    return "secret code : \(code)\n"
            + "meeting point : \(point)\n"
            + "time : \(time)"
}

func main() {
    guard let input = readInput() else { return }
    print(input |> solution)
}

main()