import Foundation

let timeArr = readLine()!.split(separator: "-")

let (y, m, d) = (timeArr[2], timeArr[0], timeArr[1])

print("\(y).\(m).\(d)")