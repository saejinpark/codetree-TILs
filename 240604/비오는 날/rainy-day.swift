import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

class Weather: Hashable, Comparable, CustomStringConvertible {
    var date: String
    var day: String
    var info: String

    init(date: String, day: String, info: String ) {
        self.date = date
        self.day = day
        self.info = info
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(date)
        hasher.combine(day)
        hasher.combine(info)
    }

    static func == (lhs: Weather, rhs: Weather) -> Bool {
        return lhs.date == rhs.date
            && lhs.day == rhs.day
            && lhs.info == rhs.info
    }

    static func < (lhs: Weather, rhs: Weather) -> Bool {
        return lhs.date < rhs.date
    }

    var description: String {
        return "\(date) \(day) \(info)"
    }
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func readWeather() -> Weather? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ").map(String.init)
    if temp.count != 3 { return nil }
    return Weather(date: temp[0], day: temp[1], info: temp[2])
}

func solution(weathers: [Weather]) -> Weather {
    return weathers.filter{$0.info == "Rain"}.sorted()[0]
}

func main() {
    guard let n = readNum() else { return }
    let weathers = (1...n).compactMap({_ in readWeather()})
    print(weathers |> solution)
}

main()