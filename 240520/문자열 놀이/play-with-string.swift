import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readStrAndT() -> (String, Int)? {
    guard let line = readLine() else { return nil }
    let (str, temp) = line.split(separator: " ").map{String($0)} |> {($0[0], $0[1])}
    guard let num = Int(temp) else { return nil }
    return (str, num)
}

func questionToInput(_ question:String) -> (Int, String, String)? {
    let (temp, a, b) = question.split(separator: " ").map{String($0)} |> {($0[0], $0[1], $0[2])}
    guard let command = Int(temp) else {return nil}
    return (command, a, b)
}

func tempToCommand1AB(_ temp1:String, _ temp2:String) -> (Int, Int)? {
    guard let a = Int(temp1), let b = Int(temp2) else { return nil }
    return (a, b)
}

func solution(component:(String, Int, [String])) -> String {
    let (str, t, questions) = component
    var answer:[String] = []
    var strArr = Array(str).map{String($0)}
    for question in questions {
        guard let (command, temp1, temp2) = questionToInput(question) else {return "Error"}
        switch(command) {
            case 1:
                if let (a, b) = tempToCommand1AB(temp1, temp2) {
                    let temp = strArr[a - 1]
                    strArr[a - 1] = strArr[b - 1]
                    strArr[b - 1] = temp
                } else {
                    return "Error"
                }
            case 2:
                let (a, b) = (temp1, temp2)
                for i in 0..<strArr.count {
                    if strArr[i] == a {
                        strArr[i] = b
                    }
                }
            default:
                return "Error"
        }
        answer.append(strArr.joined(separator: ""))
    }

    return answer.joined(separator: "\n")
}

func main() {
    if let (str, t) = readStrAndT() {
        let questions = (1...t).compactMap({_ in readLine()})
        if questions.count != t { return }
        print((str, t, questions) |> solution)
    }
}

main()