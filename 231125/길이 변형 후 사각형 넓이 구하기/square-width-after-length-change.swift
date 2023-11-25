import Foundation

let (w, h) = {() -> (Int, Int) in 
    let line = readLine()!
    let arr = line.split(separator: " ").map{i in Int(i)!}
    return (arr[0] + 8, arr[1] * 3)
}()

print(w)
print(h)
print(w * h)