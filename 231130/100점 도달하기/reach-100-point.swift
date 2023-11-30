import Foundation

let n = Int(readLine()!)!

func getGrade(_ score: Int) -> String {
    var grade = ""

    switch score {
        case 0...59: grade = "F"; break
        case 60...69: grade = "D"; break
        case 70...79: grade = "C"; break
        case 80...89: grade = "B"; break
        case 90...100: grade = "A"; break
        default: grade = "E"; break
    }

    return grade
}

func solution(_ n : Int) -> String {
    return (n...100).map{getGrade($0)}.joined(separator: " ")
}

let answer = solution(n)

print(answer)