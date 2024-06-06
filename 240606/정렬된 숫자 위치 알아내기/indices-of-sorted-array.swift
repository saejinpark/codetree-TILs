import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let genId = {
    var id = 1
    return {
        defer {
            id += 1
        }
        return id
    }
}()

class PosNum: Identifiable, Hashable, Equatable, Comparable, CustomStringConvertible {
    let id: Int
    let num: Int
    var temp = -1

    init(num: Int) {
        self.id = genId()
        self.num = num
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: PosNum, rhs: PosNum) -> Bool {
        return lhs.id == rhs.id
    }

    static func < (lhs: PosNum, rhs: PosNum) -> Bool {
        return lhs.num < rhs.num
    }

    var description: String {
        return "\(id)"
    }
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line.trimmingCharacters(in: .whitespaces)) else { return nil }
    return num
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if temp.count != nums.count { return nil }
    return nums
}

func solution(nums: [Int]) -> String {
    let posNums = nums.map(PosNum.init)
    let sortedPosNums = posNums.sorted()
    for (index, elem) in sortedPosNums.enumerated() {
        elem.temp = index + 1
    }

    return posNums.map{String($0.temp)}.joined(separator: " ")
}

func main() {
    guard let n = readNum(), let nums = readNums() else { return }
    if n != nums.count { return }
    print(nums |> solution)
}

main()