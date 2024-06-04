import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readAgentInfo() -> (String, Int)? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    guard temp.count == 2, let score = Int(temp[1]) else { return nil }
    return (String(temp[0]), score)
}

class Agent: Hashable, Comparable, CustomStringConvertible {
    var id: String
    var score: Int

    init(id: String, score: Int) {
        self.id = id
        self.score = score
    }

    init(info: (String, Int)) {
        let (id, score) = info
        self.id = id
        self.score = score
    }

    static func == (lhs: Agent, rhs: Agent) -> Bool {
        return lhs.score == rhs.score && lhs.id == rhs.id
    }

    static func < (lhs: Agent, rhs: Agent) -> Bool {
        if lhs.score == rhs.score {
            return lhs.id < rhs.id
        }
        return lhs.score < rhs.score
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(score)
    }

    var description: String {
        return "\(id) \(score)"
    } 
}

func solution(agents: [Agent]) -> String {
    return agents.sorted()[0].description
}

func main() {
    let temp = (1...5).compactMap({_ in readAgentInfo()})
    if temp.count != 5 { return }
    let agents = temp.map(Agent.init)
    print(agents |> solution)
}

main()