import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({ Int($0) })
    return temp.count == nums.count ? nums : nil
}

func solution(component:(Int,[Int])) -> String {
    let (n, nums) = component
    var limit = n
    var indexs:[Int] = []
    while true {
        var maxIndex = 0
        for i in 1..<limit {
            if nums[i] > nums[maxIndex] {
                maxIndex = i
            }
        }
        indexs.append(maxIndex)
        if maxIndex == 0 {
            break
        } else {
            limit = maxIndex
        }
    }
    return indexs
            .map{ String($0 + 1) }
            .joined(separator: " ")
}

func main() {
    if let n = readNum(), let nums = readNums() {
        print((n, nums) |> solution)
    }
}

main()