import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readAlphas() -> [String]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ").map{String($0)}
    let alphas = temp.filter{$0.count == 1}
    return temp.count == alphas.count ? alphas : nil
}

func readInput() -> [[String]]? {
    var alphasArr:[[String]] = []
    for i in 1...5 {
        if let alphas = readAlphas() {   
            alphasArr.append(alphas)
        } else {
            return nil
        }
    }

    return alphasArr
}

func solution(alphasArr:[[String]]) -> String {
    return alphasArr
            .map{
                $0.map{
                    $0.uppercased()
                }
                .joined(
                    separator:" ")
            }
            .joined(separator: "\n")
}

func main() {
    if let alphasArr = readInput() {
        print(alphasArr |> solution)
    }
}

main()