import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readStrAndInt() -> (String, Int)? {
    guard let line = readLine() else { return nil }
    let (str, temp) = line.split(separator: " ").map(String.init) |> {($0[0], $0[1])}
    guard let q = Int(temp) else { return nil }
    return (str, q)
}

func shift(str:String) -> String {
    var strArr = Array(str).map(String.init)
    strArr.append(strArr.remove(at: 0))
    return strArr.joined(separator: "")
}

func unshift(str:String) -> String {
    var strArr = Array(str).map(String.init)
    strArr.insert(strArr.remove(at: strArr.count - 1), at: 0)
    return strArr.joined(separator: "")
}
func reverse(str:String) -> String {
    return Array(str).map(String.init).reversed().joined(separator: "")
}

func commandFunc(command: Int, str:String) -> String {
    switch(command) {
        case 1:
            return str |> shift
        case 2:
            return str |> unshift
        case 3:
            return str |> reverse
        default:
            return ""
    }
}

func solution(component: (String, Int, [Int])) -> String {
    let (str, q, nums) = component
    var currentStr = str
    var arr:[String] = []
    for i in nums {
        currentStr = commandFunc(command: i, str: currentStr)
        arr.append(currentStr)
    }
    return arr.joined(separator: "\n")
}

func main() {
    if let (str, q) = readStrAndInt() {
        let nums = (1...q).compactMap({_ in
            if let line = readLine() {
                return Int(line)
            }
            return nil
        })
        print((str, q, nums) |> solution)
    }
}

main()