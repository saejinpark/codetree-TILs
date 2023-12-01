import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> String {
    var days = (0...n).map{_ in return -1}

    let periods = [2, 3, 12]

    for i in 0..<periods.count {
        let period = periods[i]
        for day in stride(from: period, to: n + 1, by: period) {
            days[day] = i
        }
    }

    var counts = [0, 0, 0]

    for day in days {
        if day == -1 {
            continue
        }
        counts[day] += 1
    }

    return counts.map{String($0)}.joined(separator: " ")
}

let answer = solution(n)

print(answer)