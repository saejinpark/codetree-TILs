import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func shift(str:String) -> String {
    var strArr = str.split(separator: "").map(String.init)
    let endIndex = strArr.count - 1
    let temp = strArr[endIndex]
    for i in stride(from:endIndex, to:0, by: -1) {
        strArr[i] = strArr[i - 1]
    }
    strArr[0] = temp
    return strArr.joined(separator: "")

}

func solution(line:String, count:Int = 0) -> String {
    return "\(count == 0 ? "" : "\n")\(line)\(count == line.count ? "" : solution(line: shift(str: line), count: count + 1))"
}

func main() {
    if let line = readLine() {
        print(solution(line: line))
    }
}

main()