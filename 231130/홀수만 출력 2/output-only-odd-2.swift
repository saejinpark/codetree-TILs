import Foundation

let (b, a) = {
    let nums = readLine()!.split(separator: " ").map{Int($0)!}
    return (nums[0], nums[1])
}()

func solution(_ a: Int, _ b: Int) {
    var (start, end) = (b % 2 == 0 ? b - 1 : b, a - 1)
    print(stride(from: start, to: end, by: -2).map{String($0)}.joined(separator: " "))
}

solution(a, b)