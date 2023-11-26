import Foundation

let isMan = readLine()! == "0"
let isAdult = Int(readLine()!)! >= 19

print(isMan ? isAdult ? "MAN" : "BOY" : isAdult ? "WOMAN" : "GIRL")