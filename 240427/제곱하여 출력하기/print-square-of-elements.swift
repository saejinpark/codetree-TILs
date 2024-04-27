import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readInt() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({ Int($0) })
    return temp.count == nums.count ? nums : nil
}

func solution(_ T:Int, _ nums:[Int]) -> String {
    return nums
            .map{ String(Int(pow(Float($0), 2))) }
            .joined( separator: " " )
}

func main() {
    if let T = readInt(), let nums = readNums() {
        print(solution(T, nums))
    }
}

main()