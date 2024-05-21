import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func shift(str: String) -> String {
    var strArr = Array(str).map(String.init)
    strArr.append(strArr.remove(at: 0))
    return strArr.joined(separator: "")
}

func unshift(str: String) -> String {
    var strArr = Array(str).map(String.init)
    strArr.insert(strArr.remove(at: strArr.count - 1), at: 0)
    return strArr.joined(separator: "")
}

func solution(component:(String, [String])) -> String {
    let (str, commands) = component
    var answer = str
    for command in commands {
        switch(command) {
            case "L":
                answer = shift(str: answer)
            case "R":
                answer = unshift(str: answer)
            default:
                return "Error"
        }
    }
    return answer
}

func main() {
    if let str = readLine(), let temp = readLine() {
        let commands = Array(temp).map(String.init)
        print((str, commands) |> solution)
    }
}

main()