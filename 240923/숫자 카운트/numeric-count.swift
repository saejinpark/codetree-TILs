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

func readNumAndCount() -> (Int, Int, Int)? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ").map(String.init)
    let nums = temp.compactMap{ Int($0) }
    return temp.count == nums.count && nums.count == 3 ? (nums[0], nums[1], nums[2]) : nil
}

func numToArr(num: Int) -> [Int] {
    return String(num).compactMap { Int(String($0)) }
}


func genTestItem(_ component: (Int, Int, Int)) -> (Int) -> Bool {
    let (num, sCount, bCount) = component
    let baseLine = numToArr(num: num)
    return { (testNum: Int) in
        let testCase = numToArr(num: testNum)
        var strike = 0
        var ball = 0

        for i in 0..<3 {
            if baseLine[i] == testCase[i] {
                strike += 1
            } else if baseLine.contains(testCase[i]) {
                ball += 1
            }
        }
        return strike == sCount && ball == bCount
    }
}

func genTest(_ input: [(Int, Int, Int)]) -> (Int) -> Bool {
    var testItems = [(Int) -> Bool]()
    for i in input {
        testItems.append(genTestItem(i))
    }
    return { (num: Int) in
        testItems.allSatisfy { $0(num) }
    }
}

func solution(_ component: (Int, [(Int, Int, Int)])) -> Int {
    let (n, input) = component
    let test = genTest(input)
    
    var answer = 0

    for num in 123...987 {
        let testCase = numToArr(num: num)
        if testCase[0] == testCase[1] || testCase[1] == testCase[2] || testCase[0] == testCase[2] {
            continue
        }

        if test(num) {
            answer += 1
        }

    }

    return answer
}

func main() {
    guard let n = readNum() else { return }
    let input = (1...n).compactMap{ _ in readNumAndCount() }
    print(solution((n, input)))
}

main()