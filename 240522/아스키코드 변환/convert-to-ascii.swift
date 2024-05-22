import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readCharAndInt() -> (String, Int)? {
    guard let line = readLine() else {return nil}
    let temp = line.split(separator:" ").map(String.init)
    if temp.count != 2 {
        return nil
    }
    guard let num = Int(temp[1]) else { return nil }
    return (temp[0], num)
}

func strToAscii(_ str:String) -> Int? {
    guard let ascii = Character(str).asciiValue else { return nil }
    return Int(ascii)
}

func asciiToStr(_ ascii:Int) -> String {
    return String(UnicodeScalar(UInt8(ascii)))
}

func solution(component:(String, Int)) -> String {
    let (str, ascii) = component
    guard let asciiStr = strToAscii(str) else { return "Error" }
    return "\(asciiStr) \(asciiToStr(ascii))"
}

func main() {
    if let input = readCharAndInt() {
        print(input |> solution)
    }
}

main()