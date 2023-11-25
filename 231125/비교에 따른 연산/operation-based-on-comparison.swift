import Foundation

let (a, b) = {
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    return (line.first!, line.last!)
}()

print(a > b ? a * b : b / a)