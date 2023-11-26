import Foundation

var first = readLine()!.split(separator: " ").map{Int($0)!}
var second = readLine()!.split(separator: " ").map{Int($0)!}

if first[0] > second[0] {
    print("A")
} else if first[0] < second[0] {
    print("B")
} else {
    if first[1] > second[1] {
        print("A")
    } else if first[1] < second[1] {
        print("B")
    } 
}