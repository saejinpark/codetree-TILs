import Foundation

let n = Int(readLine()!)!

func toStrArr(_ arr : [Int]) -> [String] {
    return arr.map{String($0)}
}

func solution(_ n : Int) -> String {
    let unit = 3
    var i = 1
    var arr = [Int]()
    while i * unit <= n {
        arr.append(i * unit)       
        i += 1
    }
    return toStrArr(arr).joined(separator: " ")
}

print(solution(n))