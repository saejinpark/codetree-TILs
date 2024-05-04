import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    return temp.count == nums.count ? nums : nil
}

func readInput() -> [[Int]]? {
    var numsArr:[[Int]] = []
    for _ in 1...2 {
        if let nums = readNums(), nums.count == 4 {
            numsArr.append(nums)
        } else { return nil }
    }
    return numsArr
}

func getWidthAvgs(numsArr:[[Int]]) -> String {
    var arr:[Float] = []
    for nums in numsArr {
        let sum = nums.reduce(0, +)
        let avg = Float(sum * 10 / nums.count) / 10
        arr.append(avg)
    }
    return arr.map{String($0)}.joined(separator: " ")
}

func getHeightAvgs(numsArr:[[Int]]) -> String {
    var arr:[Float] = []
    for i in 0..<numsArr[0].count {
        var sum = 0
        for j in 0..<numsArr.count {
            sum += numsArr[j][i]
        }
        let avg = Float(sum * 10 / numsArr.count) / 10

        arr.append(avg)
    }
    return arr.map{String($0)}.joined(separator: " ")
}

func getTotalAvgs(numsArr:[[Int]]) -> Float {
    var sum = 0
    var totalCount = 0
    for i in 0..<numsArr.count {
        totalCount += numsArr[i].count
        for j in 0..<numsArr[i].count {
            sum += numsArr[i][j]
        }
    }
    return Float(sum * 10 / totalCount) / 10
}

func solution(numsArr:[[Int]]) -> String {
    let widthAvg = numsArr |> getWidthAvgs
    let heightAvg = numsArr |> getHeightAvgs
    let totalAvgs = numsArr |> getTotalAvgs
    return "\(widthAvg)\n\(heightAvg)\n\(totalAvgs)"
}

func main() {
    if let numsArr = readInput() {
        print(numsArr |> solution)
    }
}

main()