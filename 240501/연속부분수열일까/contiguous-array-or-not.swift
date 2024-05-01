import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function:(T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({ Int($0) })
    return temp.count == nums.count ? nums : nil
}

func solution(
        _ n1:Int,
        _ n2:Int,
        _ main:[Int],
        _ sub:[Int]
    ) -> String {
    if n2 > n1 { return "No" }

    for s in 0..<(n1 - n2) {
        var testCase = true
        for i in 0..<n2 {
            if main[s + i] != sub[i] {
                testCase = false
                break
            }
        }
        if testCase {
            return "Yes"
        }
    }

    return "No"

}

func main() {
    if let temp = readNums(),
       let main = readNums(),
       let sub = readNums() {
        if temp.count != 2 { return }
        let (n1, n2) = temp |> { ($0.first!, $0.last!) }
        print(solution(n1, n2, main, sub))
    } 
}

main()