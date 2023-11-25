import Foundation

func callStudent(number : Int) -> String {
    var answer = ""
    switch number
    {
        case 1 :
            answer = "John"
            break
        case 2 :
            answer = "Tom"
            break
        case 3 :
            answer = "Paul"
            break
        default:
            break       
    }
    return answer
}

let n = Int(readLine()!)!

print(callStudent(number: n))