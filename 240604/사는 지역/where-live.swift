import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

class Person: Hashable, Comparable, CustomStringConvertible {
    var name: String
    var addr: String
    var city: String

    init(name: String, addr: String, city: String) {
        self.name = name
        self.addr = addr
        self.city = city
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(addr)
        hasher.combine(city)
    }

    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.name < rhs.name
    }

    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
            && lhs.addr == rhs.addr
            && lhs.city == rhs.city
    }

    var description: String {
        return "name \(name)\n"
            + "addr \(addr)\n"
            + "city \(city)"
    }
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func readPerson() -> Person? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ").map(String.init)
    if temp.count != 3 { return nil }
    return Person(name: temp[0], addr: temp[1], city: temp[2])
}

func solution(people: [Person]) -> Person {
    return people.sorted()[people.count - 1]
}

func main() {
    guard let num = readNum() else { return }
    let people = (1...num).compactMap({_ in readPerson()})
    if people.count != num { return }
    print(people |> solution)
}

main()