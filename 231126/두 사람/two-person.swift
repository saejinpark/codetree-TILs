import Foundation

class Person {
    var age = 0
    var gender = ""

    init(age : Int, gender : String) {
        self.age = age
        self.gender = gender
    }
}

func input() -> Person {
    let infoArr = readLine()!.split(separator: " ")
    return Person(age: Int(infoArr[0])!, gender: String(infoArr[1]))
}

let a = input()
let b = input()

var answer = 0

for person in [a, b] {
    if person.age >= 19 && person.gender == "M" {
        answer = 1
        break
    }
}

print(answer)