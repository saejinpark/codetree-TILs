import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if temp.count != nums.count { return nil }
    return nums
}

func asciiToStr(ascii:Int) -> String {
    return String(Character(UnicodeScalar(UInt8(ascii))))
}


func solution(nums:[Int]) -> String {
    return nums.map(asciiToStr).joined(separator: " ")
}

func main() {
    if let nums = readNums() {
        print(nums |> solution)
    }
}

main()