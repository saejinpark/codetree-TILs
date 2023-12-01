import Foundation

let n = Int(readLine()!)!

let solution = {($0...$1).reduce(0){$0 + $1}}

let answer = solution(n, 100)

print(answer)