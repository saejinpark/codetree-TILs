import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func solution(component: (Int, String)) -> Int {
    let (n, str) = component
    let strArr = str.split(separator: "").map(String.init)
    var count = 0
    for i in 0..<(n - 2) {
        for j in (i + 1)..<(n - 1) {
            for k in (j + 1)..<n {
                if strArr[i] + strArr[j] + strArr[k] == "COW" {
                    count += 1
                }
            }
        }
    }
    return count
}

func main() {
    guard let n = readNum(), let str = readLine() else { return }
    if n != str.count { return }
    print((n, str) |> solution)
}

main()