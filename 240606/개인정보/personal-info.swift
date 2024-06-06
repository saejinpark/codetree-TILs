import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

class Person: Hashable, Equatable, Comparable, CustomStringConvertible {
    let name: String
    let tall: Int
    let weight: Float

    init(name: String, tall: Int, weight: Float) {
        self.name = name
        self.tall = tall
        self.weight = weight
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(tall)
        hasher.combine(weight)
    }

    static func == (lhs: Person, rhs: Person) -> Bool  {
        return lhs.name == rhs.name
            && lhs.tall == rhs.tall
            && lhs.weight == rhs.weight
    }

    static func < (lhs: Person, rhs: Person) -> Bool  {
        return lhs.name < rhs.name
    }

    var description: String {
        return "\(name) \(tall) \(String(format: "%0.1f", weight))"
    }
}

func readPerson() -> Person? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    guard temp.count == 3,
        let tall = Int(temp[1]),
        let weight = Float(temp[2])
    else { return nil }
    return Person(name: String(temp[0]), tall: tall, weight: weight)
}

func solution(people: [Person]) -> String {

    return "name\n"
        + "\(people.sorted{(lhs, rhs) in lhs.name < rhs.name}.map{$0.description}.joined(separator: "\n"))\n"
        + "\n"
        + "height\n"
        + "\(people.sorted{(lhs, rhs) in lhs.tall > rhs.tall}.map{$0.description}.joined(separator: "\n"))\n"
}

func main() {
    let people = (1...5).compactMap({_ in readPerson()})
    print(people |> solution)
}

main()