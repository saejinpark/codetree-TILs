import Foundation

let (a, b) = {
    let nums = readLine()!.split(separator: " ").map{Int($0)!}

    if nums.last! > nums.first! {
        return (nums.last!, nums.first!)
    }

    return (nums.first!, nums.last!)
}()


print(a - b)