import Foundation

func input() -> Float {
    return round(Float(readLine()!)! * 1000) / 1000
}

for i in [input(), input(), input()] {
    print(String(format: "%.3f", i))
}