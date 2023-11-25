import Foundation

let (a, b) = {
    let line = readLine()!
    let nums = line.split(separator : " ").map{Float($0)!}
    return (nums.first!, nums.last!)
}()

print(String(format: "%.2f", (a + b) / (a - b)))