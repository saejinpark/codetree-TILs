func toStrArr(_ arr: [Int]) -> [String] {
    return arr.map{String($0)}
}

func solution() -> String {
    var arr = [Int]()
    var i = 10
    var unit = 2
    while i <= 26 {
        arr.append(i)
        i += unit
    }
    return toStrArr(arr).joined(separator: " ")
}

print(solution())