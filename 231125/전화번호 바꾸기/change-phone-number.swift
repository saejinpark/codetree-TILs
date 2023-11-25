import Foundation

let phoneNumArr = readLine()!.split(separator: "-")

let (x, y) = (phoneNumArr[1], phoneNumArr[2])

print("010-\(y)-\(x)")