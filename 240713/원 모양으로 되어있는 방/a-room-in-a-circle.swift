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

func moveFirstToLast<T> (arr: [T]) -> [T] {
    var temp = arr
    temp.append(temp.remove(at: 0))
    return temp
}

func calculateDistance(nums: [Int]) -> Int {
    return nums.enumerated().map{(i, value) in value * i}.reduce(0, +)
}

func solution(component: (Int, [Int])) -> Int {
    let (n, rooms) = component
    var answer = calculateDistance(nums: rooms)
    var current = rooms
    
    for _ in 1...n {
        current = moveFirstToLast(arr: current)
        let testCase = calculateDistance(nums: current)
        answer = answer < testCase ? answer : testCase
    }

    return answer
}

func main() {
    guard let n = readNum() else { return }
    var rooms = (1...n).compactMap({_ in readNum()})
    print((n, rooms) |> solution)
}

main()