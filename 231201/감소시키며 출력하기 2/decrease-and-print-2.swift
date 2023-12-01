import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

public func |> <T, U>(value: T, function: ((T) -> U)) -> U {
    return function(value)
}

func toStrArr(_ arr: [Int]) -> [String]{
    return arr.map{String($0)}
}

func arrToStr(_ arr : [String]) -> String {
    return arr.joined(separator: " ")
}

func solution() -> String {
    var arr = [Int]()
    let (from, end, by) = (26, 10, -1)
    var i = from

    while i <= end {
        arr.append(i)
        i = i + by
    }

    return arr |> toStrArr |> arrToStr
}

print(solution())