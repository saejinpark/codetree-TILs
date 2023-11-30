import Foundation

let (a, b) = {
    let nums = readLine()!.split(separator: " ").map{Int($0)!}
    return (nums[0], nums[1])
}()

func toStrArr(_ arr : [Int]) -> [String] {
    return arr.map{String($0)}
}

func solution(_ a : Int, _ b : Int) -> String {
    var arr = [Int]()
    var i = a % 2 == 1 ? a + 1 : a
    while i <= b{
        arr.append(i)
        i = i + 2
    }

    return toStrArr(arr).joined(separator: " ")
}

print(solution(a, b))