import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

class Person: Hashable, Comparable, CustomStringConvertible {
    let name: String
    let tall: Int
    let weight: Int
    
    init(name: String, tall: Int, weight: Int) {
        self.name = name
        self.tall = tall
        self.weight = weight
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(tall)
        hasher.combine(weight)
    }

    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
                && lhs.tall == rhs.tall
                && lhs.weight == rhs.weight
    }

    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.tall < rhs.tall
    }

    var description: String {
        return "\(name) \(tall) \(weight)"
    }
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func readPerson() -> Person? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    guard temp.count == 3,
        let tall = Int(temp[1]),
        let weight = Int(temp[2]) else { return nil }
    
    return Person(name: String(temp[0]), tall: tall, weight: weight)
}

func solution(people: [Person]) -> String {
    return people.sorted().map{$0.description}.joined(separator: "\n")
}

func main() {
    guard let n = readNum() else { return }
    let people = (1...n).compactMap({_ in readPerson()})
    print(people |> solution)
}

main()