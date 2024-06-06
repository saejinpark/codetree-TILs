import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let genNum = {
    var num = 1
    return {
        defer {
            num += 1
        }

        return num
    }
}()

class Student: Hashable, Equatable, Comparable, CustomStringConvertible {
    let num: Int
    let tall: Int
    let weight: Int

    init(tall: Int, weight: Int) {
        self.num = genNum()
        self.tall = tall
        self.weight = weight
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(tall)
        hasher.combine(weight)
    }

    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.tall == rhs.tall && lhs.weight == rhs.weight
    }

    static func < (lhs: Student, rhs: Student) -> Bool {
        return lhs.tall != rhs.tall
                ? lhs.tall < rhs.tall
                : lhs.weight < rhs.weight
    }

    var description: String {
        return "\(tall) \(weight) \(num)"
    }
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func readStudent() -> Student? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    guard temp.count == 2,
    let tall = Int(temp[0]),
    let weight = Int(temp[1])
    else { return nil }
    return Student(tall: tall, weight: weight)
}

func solution(students: [Student]) -> String {
    return students.sorted().map{$0.description}.joined(separator: "\n")
}

func main() {
    guard let n = readNum() else { return }
    let students = (1...n).compactMap({_ in readStudent()})
    if n != students.count { return }
    print(students |> solution)
}

main()