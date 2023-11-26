import Foundation

let a = readLine()!.split(separator: " ").map{Int($0)!}
let b = readLine()!.split(separator: " ").map{Int($0)!}

print(a[0] > b[0] && a[1] > b[1] ? 1 : 0)