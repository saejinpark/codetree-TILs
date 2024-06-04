import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

class BombDefusal: CustomStringConvertible {
    var code: String
    var alpha: String
    var time: Int

    init(code: String, alpha: String, time: Int) {
        self.code = code
        self.alpha = alpha
        self.time = time
    }

    var description: String {
        return "code : \(code)\n"
            + "color : \(alpha)\n"
            + "second : \(34)"
    }
}

func readBombDefusal() -> BombDefusal? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ").map(String.init)
    guard temp.count == 3, let time = Int(temp[2]) else { return nil }
    return BombDefusal(code: temp[0], alpha: temp[1], time: time) 
}

func main() {
    guard let bombDefusal = readBombDefusal() else { return }
    print(bombDefusal)
}

main()