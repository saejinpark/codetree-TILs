import Foundation

let a = Int(readLine()!)!

func isMul(_ n : Int, _ m : Int) -> Bool {
    return n >= m && n % m == 0
}

print(isMul(a, 3) ? "YES" : "NO")
print(isMul(a, 5) ? "YES" : "NO")