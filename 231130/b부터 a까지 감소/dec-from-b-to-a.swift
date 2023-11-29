import Foundation

let (a, b) = {
    let nums = readLine()!.split(separator: " ").map{Int($0)!}
    return (nums[0], nums[1])
}()

func solution(_ a: Int, _ b: Int) {
    print(stride(from: b, to: a - 1, by: -1).map{String($0)}.joined(separator: " "))
}

solution(a, b)