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
    let temp = line.split(separator: " ").map(String.init)
    let nums = temp.compactMap{ Int($0) }
    return temp.count == nums.count ? nums : nil
}


func genTest(_ base: [Int], _ limit: Int) -> ([Int]) -> Bool {
    return { (testCase: [Int]) in
        return zip(base, testCase).allSatisfy { limit - ($0 + $1) % limit <= 2 || ($0 + $1) % limit <= 2 }
    }
}

func solution(_ component: (Int, [Int], [Int])) -> Int {
    let (n, comb1, comb2) = component

    var answer = 0

    let test1 = genTest(comb1, n)
    let test2 = genTest(comb2, n)

    for i in 1...n {
        for j in 1...n {
            for k in 1...n {
                let testCase = [i, j, k]
                if test1(testCase) || test2(testCase) {
                    answer += 1
                }
            }
        }
    }

    return answer
}

func main() {
    guard let n = readNum(), let comb1 = readNums(), let comb2 = readNums() else { return }
    print(solution((n, comb1, comb2)))
}

main()