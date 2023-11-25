import Foundation

let date = readLine()!.split(separator: ".").map{i in Int(i)!}

let (y, m, d) = (date[0], date[1], date[2])

print("\(m)-\(d)-\(y)")