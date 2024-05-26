import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if temp.count != nums.count { return nil }
    return nums
}


func valiedTest(num: Int) -> Bool {
    if num % 3 == 0 {
        return true
    }
    let numStr = String(num)
    for i in ["3", "6", "9"] {
        if numStr.contains(i) {
            return true
            break
        }
    } 
    return false
}

func solution(input: (Int, Int)) -> Int {
    let (a, b) = input
    return (a...b)
        .filter(valiedTest).count
}

func main() {
    guard let nums = readNums() else { return }
    if nums.count != 2 { return }
    let (a, b) = (nums[0], nums[1])
    print((a, b) |> solution)
}

main()