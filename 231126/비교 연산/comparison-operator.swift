import Foundation

let (a, b) = {
    let nums = readLine()!.split(separator: " ").map{Int($0)!}
    return (nums[0], nums[1])
}()

//a가 b보다 같거나 큰가?
print(a >= b ? 1 : 0)

//a가 b보다 큰가?
print(a > b ? 1 : 0)

//b가 a보다 같거나 큰가?
print(b >= a ? 1 : 0)

//b가 a보다 큰가?
print(b > a ? 1 : 0)

//a와 b가 같은가?
print(a == b ? 1 : 0)

//a와 b가 다른가?
print(a != b ? 1 : 0)