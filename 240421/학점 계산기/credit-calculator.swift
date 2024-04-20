import Foundation

precedencegroup FowordPipe {
    associativity: left
}

infix operator |> : FowordPipe

func |> <T, U> (value: T, function:(T) -> U) -> U {
    return function(value)
}

func readInt() -> Int? {
    guard let line = readLine(), let int = Int(line)
    else { return nil }
    return int
}

func readFloats() -> [Float]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let floats = temp.compactMap({Float($0)})
    if temp.count != floats.count { 
        return nil
    }
    return floats
}

func avgToGrade(_ avg: Float) -> String {
    switch(avg) {
        case 0.0..<3.0:
            return "Poor"
        case 3.0..<4.0:
            return "Good"
        case 4.0...5:
            return "Perfect"
        default:
            return "Error"
    }
} 

func solution(_ T:Int, _ floats: [Float]) -> String {
    let sum = floats.reduce(0.0, +)
    let avg = sum / Float(T)
    var grade = avgToGrade(avg)
    return "\( String(format: "%.1f", avg) )\n\( grade )"
}

func main() {
    if let T = readInt(), let floats = readFloats() {
        print(solution(T, floats))
    }
}

main()