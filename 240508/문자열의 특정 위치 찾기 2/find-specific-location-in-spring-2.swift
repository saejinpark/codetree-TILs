import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

let fruits = ["apple", "banana", "grape", "blueberry", "orange"]

func solution(str:String) -> String {
    let selectedFruits = fruits.map{$0.split(separator:"")}.filter{$0[2] == str || $0[3] == str}.map{$0.joined(separator:"")}
    return "\(selectedFruits.joined(separator:"\n"))\(selectedFruits.count > 0 ? "\n": "")\(selectedFruits.count)"
}

func main() {
    if let str = readLine() {
        print(str |> solution)
    }
}

main()