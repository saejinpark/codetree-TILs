import Foundation

let y = Int(readLine()!)!

func isLeapYear(year: Int) -> Bool {
    if year % 4 != 0 {
        return false
    }

    if year % 400 == 0 {
        return true
    }

    if year % 100 == 0 {
        return false
    }

    return true
}

print(isLeapYear(year: y))