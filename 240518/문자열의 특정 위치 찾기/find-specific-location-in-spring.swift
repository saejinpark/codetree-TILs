import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func solution(component:(String, String)) -> Int? {
    let (str, base) = component
    if let index = Array(str).map{String($0)}.index(of: base) {
        return index
    }
    return nil
}

func main() {
    if let line = readLine() {
        let (str, base) = line.split(separator: " ").map{String($0)} |> {($0[0], $0[1])}
        if let answer = (str, base) |> solution {
            print(answer)
            return
        }
        print("No")
    }
}

main()