import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let genId = {
    var id = 1
    return {
        defer {
            id += 1
        }
        return id
    }
}()

class Coordinate: Identifiable, Hashable, Equatable, Comparable, CustomStringConvertible {
    let id: Int
    let x: Int
    let y: Int
    let distance: Int
    
    init(x: Int, y: Int) {
        self.id = genId()
        self.x = x
        self.y = y
        self.distance = abs(0 - x) + abs(0 - y)
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }

    static func == (lhs: Coordinate, rhs: Coordinate) -> Bool {
        return lhs.id == rhs.id
    }

    static func < (lhs: Coordinate, rhs: Coordinate) -> Bool {
        return lhs.distance != rhs.distance
                ? lhs.distance < rhs.distance
                : lhs.id < rhs.id
    }

    var description: String {
        return "\(id)"
    }
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func readCoordinate() -> Coordinate? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    guard temp.count == 2, let x = Int(temp[0]), let y = Int(temp[1]) else { return nil }
    return Coordinate(x: x, y: y)
}

func solution(coords: [Coordinate]) -> String {
    return coords.sorted().map{$0.description}.joined(separator: "\n")
}

func main() {
    guard let n = readNum() else { return }
    let coords = (1...n).compactMap({_ in readCoordinate()})
    print(coords |> solution)
}

main()