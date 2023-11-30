func solution() -> String {
    var n = 10
    var arr = [Int]()

    while n <= 26 {
        arr.append(n)
        n += 1
    }

    return arr.map{String($0)}.joined(separator: " ")
}

print(solution())