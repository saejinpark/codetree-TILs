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

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if temp.count != nums.count { return nil }
    return nums
}

func findMidIndex <T> (arr: [T]) -> T {
    let midIndex = arr.count / 2
    return arr[midIndex]
}

let _solution = {
    var arr:[Int] = []
    return {(num: Int) -> Int in
        arr.append(num)
        return arr.count % 2 == 1 ? findMidIndex(arr: arr) : -1
    }
}()

func solution(nums: [Int]) -> String {
    var arr: [Int] = []
    for i in nums {
        let temp = _solution(i)
        if temp != -1 {
            arr.append(temp)
        } 
    }

    return arr.map(String.init).joined(separator: " ")
}

func main() {
    guard let n = readNum(), let nums = readNums() else { return }
    if n != nums.count { return }
    print(nums |> solution)
}

main()