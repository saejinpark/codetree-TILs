import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readTwoStr() -> (String, String)? {
    guard let line = readLine() else {return nil}
    let strs = line.split(separator: " ")
    if strs.count != 2 {
        return nil
    }
    return strs.map(String.init) |> {($0[0], $0[1])}
}

func singleStrToAscii(_ str:String) -> Int? {
    if str.count != 1 { return nil }
    let char = Character(str)
    guard let ascii = char.asciiValue else { return nil }
    return Int(ascii)
}

func solution(twoStr:(String, String)) -> String {
    let (str1, str2) = twoStr
    if let ascii1 = singleStrToAscii(str1), let ascii2 = singleStrToAscii(str2) {
        return "\(ascii1 + ascii2) \(ascii1 > ascii2 ? ascii1 - ascii2 : ascii2 - ascii1)"
    }
    return "Error"
}

func main() {
    if let input = readTwoStr() {
        print(input |> solution)
    }
}

main()