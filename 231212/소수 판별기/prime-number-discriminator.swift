import Foundation

let n = Int(readLine()!)!

func isPrime(_ n: Int) -> Bool {
    if n < 2 {
        return false
    }
    for i in 2...Int(sqrt(Float(n))) {
        if n % i == 0 {
            return false
        }   
    }
    return true
}

func solution(_ n: Int) -> String {
    return isPrime(n) ? "P" : "C"
}

let answer = solution(n)

print(answer)