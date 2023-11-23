import Foundation

var a = readLine()!.split(separator: ":").map{i in Int(i)!}

a[0] = a[0] == 23 ? 0 : a[0] + 1

let (h, m) = (a[0], a[1])

print("\(h):\(m)")