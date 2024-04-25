import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readStrItems() -> [String]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ").map(String.init)
    let strItems = temp.filter{ $0.count == 1 }
    return temp.count == strItems.count ? strItems : nil
}

func solution(_ strItems:[String]) -> String {
    return strItems
                .enumerated()
                .filter{(index, _) in [1, 4, 7]
                .contains(index)}
                .map{(index, element) in element}
                .joined(separator: " ")
}

func main() {
    if let strItems = readStrItems() {
        print(solution(strItems))
    }
}

main()