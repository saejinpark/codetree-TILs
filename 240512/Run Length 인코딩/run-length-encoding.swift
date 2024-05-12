import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}


func solution(line:String) -> String {
    var arr:[String] = []
    var temp = ""
    for i in line.split(separator:"").map{String($0)} {
        if temp.count == 0 {
            temp += i
            continue
        }
        if temp.suffix(1) == i {
            temp += i
        } else {
            arr.append(temp)
            temp = i
        }
    }
    if temp.count != 0 {
        arr.append(temp)
    }

    let encodedLine = arr
                        .map{"\($0.prefix(1))\($0.count)" }
                        .joined(separator:"")

    return "\(encodedLine.count)\n\(encodedLine)"

}

func main() {
    if let line = readLine() {
        print(line |> solution)
    }
}

main()