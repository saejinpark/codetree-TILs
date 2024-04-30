import Foundation

let arr = ["L", "E", "B", "R", "O", "S"]
var dict:[String:Int] = [:]

for (index, value) in arr.enumerated() {
    dict[value] = index
}

func solution(_ str:String) -> String {
    var answer = "None"
    if let index = dict[str] {
        answer = String(index)
    }
    return answer
}

func main() {
    if let str = readLine() {
        print(solution(str))
    }
}

main()