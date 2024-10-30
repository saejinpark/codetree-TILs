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
    let nums = temp.compactMap({ Int($0) })
    return temp.count == nums.count ? nums : nil
}

func readNumPair() -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums[0], nums[1])
}

func solution(_ component: (Int, Int, [Int])) -> Int {
    let (n, b, students) = component
    let sortedStudnets = students.sorted()

    var answer = 0
    var price = 0
    
    for i in 0..<sortedStudnets.count {
        var testCase = 0
        
        for j in 0..<i {
            testCase += sortedStudnets[j]
        }

        testCase += i / 2

        if testCase <= b {
            answer = i + 1
        } else {
            break
        }
    }

    return answer
}

func main() {
    guard let (n, b) = readNumPair() else { return }
    let students = (1...n).compactMap({ _ in readNum() })

    print(solution((n, b, students)))
}

main()