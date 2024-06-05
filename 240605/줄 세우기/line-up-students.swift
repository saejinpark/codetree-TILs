import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

class Student: Identifiable, Hashable, Equatable, Comparable, CustomStringConvertible {
    let id: Int
    let tall: Int
    let weight: Int

    init(id: Int, tall: Int, weight: Int) {
        self.id = id
        self.tall = tall
        self.weight = weight
    }

    func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }

    static func == (lhs: Student, rhs: Student) -> Bool {
       return lhs.id == rhs.id 
    }

    static func < (lhs: Student, rhs: Student) -> Bool {
        return lhs.tall != rhs.tall
            ? lhs.tall < rhs.tall
            : lhs.weight != rhs.weight
            ? lhs.weight < rhs.weight
            : lhs.id > rhs.id 
    }

    var description: String {
        return "\(tall) \(weight) \(id)"
    }
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func readStudent(id: Int) -> Student? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    guard temp.count == 2,
        let tall = Int(temp[0]),
        let weight = Int(temp[1])
    else { return nil }
    
    return Student(id: id, tall: tall, weight: weight)
}

func solution(students: [Student]) -> String {
    return students.sorted().reversed().map{$0.description}.joined(separator: "\n")
}

func main() {
    guard let n = readNum() else { return }
    let students = (1...n).compactMap({$0 |> readStudent})
    print(students |> solution)
}

main()