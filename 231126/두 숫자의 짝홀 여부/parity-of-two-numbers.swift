import Foundation

func isEven(_ num : Int) -> Bool {
    return num % 2 == 0
}

let (a, b) = {
    let nums = readLine()!.split(separator: " ").map{Int($0)!}
    return (nums[0], nums[1])
}()

print(isEven(a) ? "even" : "odd")
print(isEven(b) ? "even" : "odd")