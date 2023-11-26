import Foundation

let (a, b) = {
    let nums = readLine()!.split(separator: " ").map{Int($0)!}
    return (nums[0], nums[1])
}()

//첫 번째 줄에는 a가 b보다 같거나 큰지,
print(a >= b ? 1 : 0)

//두 번째 줄에는 a가 b보다 큰지,
print(a > b ? 1 : 0)

//세 번째 줄에는 b가 a보다 같거나 큰지,
print(b >= a ? 1 : 0)

//네 번째 줄에는 b가 a보다 큰지에 대한 결과를 출력합니다.
print(b > a ? 1 : 0)