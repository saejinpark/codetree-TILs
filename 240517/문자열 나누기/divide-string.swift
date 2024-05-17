import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func solution(component:(Int, String)) -> String {
    var answer:[String] = []
    var temp = ""
    let (n, line) = component
    let strNums = line.split(separator: " ")
    let nums = Array(strNums.joined(separator: "")).map{String($0)}
    for i in nums {
        temp += i
        if temp.count == 5 {
            answer.append(temp)
            temp = ""
        }
    }
    if temp.count != 0 {
        answer.append(temp)
    }
    return answer.joined(separator: "\n")


}

func main() {
    if let n = readNum(), let line = readLine() {
        print((n, line) |> solution)
    }
}

main()