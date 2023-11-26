import Foundation

let (mid, fin) = {
    let scores = readLine()!.split(separator: " ").map{Int($0)!}
    return (scores[0], scores[1])
}()

if mid < 90 {
    print(0)
} else if fin >= 95 {
    print(100000)
} else if fin >= 90 {
    print(50000)
} else {
    print(0)
}