import Foundation

let answer = (1...Int(readLine()!)!).map{_ in return Int(readLine()!)!}.filter{$0 % 2 == 1 && $0 % 3 == 0}

print(answer.map{String($0)}.joined(separator: "\n"))