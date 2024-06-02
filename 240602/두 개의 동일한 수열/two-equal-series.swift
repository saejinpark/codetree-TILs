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

func solution(component: (Int, [Int], [Int])) -> String {
    let (_, nums1, nums2) = component
    return nums1.sorted() == nums2.sorted() ? "Yes" : "No"
}

func main() {
    guard let n = readNum(), let nums1 = readNums(), let nums2 = readNums() else { return }
    print((n, nums1, nums2) |> solution)
}

main()