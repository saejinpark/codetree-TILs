import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func solution(component:(String, String)) -> Int {
    let (str1, str2) = component
    var temp = ""
    for i in Array(str1) {
        if i.isNumber {
            temp += String(i)
        } else {
            break
        } 
    }
    let num1 = Int(temp)!
    temp = ""

    for i in Array(str2) {
        if i.isNumber {
            temp += String(i)
        } else {
            break
        } 
    }
    let num2 = Int(temp)!
    return num1 + num2
}

func main() {
    if let line = readLine() {
        let temp = line.split(separator: " ").map(String.init)
        if temp.count != 2 { return }
        print((temp[0], temp[1]) |> solution)
    }
}

main()