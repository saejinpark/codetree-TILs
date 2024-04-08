import  Foundation

let n = Int(readLine()!)!

var answer = ""

for i in 1...n {
    var line = ""
    for j in 1...n {
        var num = String(j)
        line = i % 2 == 1 ? line + num : num + line
    }
    answer += line
    if i != n {
        answer += "\n"
    }
}

print(answer)