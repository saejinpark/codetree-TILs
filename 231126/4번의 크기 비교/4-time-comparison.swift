import Foundation

let a = Int(readLine()!)!
let (b, c, d, e) = {
    let nums = readLine()!.split(separator: " ").map{Int($0)!}
    return (nums[0], nums[1], nums[2], nums[3])
}()

//첫 번째 줄에 a가 b보다 크다면 1을, 크지 않다면 0을 출력합니다.
print(a > b ? 1 : 0)

//두 번째 줄에 a가 c보다 크다면 1을, 크지 않다면 0을 출력합니다.
print(a > c ? 1 : 0)

//세 번째 줄에 a가 d보다 크다면 1을, 크지 않다면 0을 출력합니다.
print(a > d ? 1 : 0)

//네 번째 줄에 a가 e보다 크다면 1을, 크지 않다면 0을 출력합니다.
print(a > e ? 1 : 0)