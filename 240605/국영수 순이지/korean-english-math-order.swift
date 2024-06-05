import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}
class Score: Hashable, Equatable, Comparable, CustomStringConvertible {
    let korean: Int
    let english: Int
    let math: Int

    init(korean: Int, english: Int, math: Int) {
        self.korean = korean
        self.english = english
        self.math = math
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(korean)
        hasher.combine(english)
        hasher.combine(math)
    }

    static func < (lhs: Score, rhs: Score) -> Bool {
        return lhs.korean != rhs.korean
            ? lhs.korean < rhs.korean
            : lhs.english < rhs.english
    }

    static func == (lhs: Score, rhs: Score) -> Bool {
        return lhs.korean == rhs.korean
                && lhs.english == rhs.english
                && lhs.math == rhs.math
    }

    var description: String {
        return "\(korean) \(english) \(math)"
    }
}

class Student: Hashable, Equatable, Comparable, CustomStringConvertible {
    let name: String
    let score: Score

    init(name: String, score: Score ) {
        self.name = name
        self.score = score
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(score)
    }

    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.score < rhs.score
    }

    static func < (lhs: Student, rhs: Student) -> Bool {
        return lhs.score.description < rhs.score.description
    }

    var description: String {
        return "\(name) \(score)"
    }
}

func readStudent() -> Student? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    guard temp.count == 4,
        let korean = Int(temp[1]),
        let english = Int(temp[2]),
        let math = Int(temp[3])
        else { return nil }

    let score = Score(korean: korean, english: english, math: math)
    return Student(name: String(temp[0]), score: score)
}

func solution(students: [Student]) -> String {
    return students
            .sorted()
            .reversed()
            .map{$0.description}
            .joined(separator: "\n")
}

func main() {
    guard let n = readNum() else { return }
    let students = (1...n).compactMap({_ in readStudent()})
    print(students |> solution)
}

main()