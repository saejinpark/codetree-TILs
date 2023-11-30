precedencegroup FowardPipe {
    associativity: left
}

infix operator |> : FowardPipe

public func |> <T, U> (value: T, function: ((T) -> U)) -> U {
    return function(value)
}

let (a, n) = readLine()!.split(separator: " ").map{Int($0)!} |> {($0[0], $0[1])}

func solution(_ a : Int, _ n : Int) -> String{
    
    return (1...n).map{String(a + $0 * n)}.joined(separator: "\n")
}

print(solution(a, n))