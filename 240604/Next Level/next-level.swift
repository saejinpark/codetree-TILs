import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

class User {
    var name: String
    var level: Int
    init (name: String, level: Int = 10) {
        self.name = name
        self.level = level
    }

    func toString() -> String {
        return "user \(name) lv \(level)"
    }
}

func readUserInfo() -> (String, Int)? {
    guard let line = readLine() else { return nil}
    let temp = line.split(separator: " ")
    if temp.count != 2 { return nil }
    guard let level = Int(temp[1]) else { return nil }
    return (String(temp[0]), level)
}

func solution(userInfo: (String, Int)) -> String {
    let (name, level) = userInfo
    let firstUser = User(name: "codetree")
    let secondUser = User(name: name, level: level)
    return "\(firstUser.toString())\n\(secondUser.toString())"    
}

func main() {
    guard let userInfo = readUserInfo() else { return }
    print(userInfo |> solution)
}

main()