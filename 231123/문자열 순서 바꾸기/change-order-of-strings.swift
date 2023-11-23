import Foundation

func input() -> String {
    return readLine()!    
}

var s = input()
var t = input()

(s, t) = (t, s)

print(s)
print(t)