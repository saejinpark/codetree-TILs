import Foundation

func input() -> Int? {
    guard let line = readLine(), let num = Int(line) else {
        return nil
    }
    return num
}

func intToLine(_ num: Int) -> String {
    return (1...num)
        .compactMap({String($0)})
        .joined(separator: " ")
}

if let n = input() {
    print(
        (1...n).map{
            intToLine($0)
        }.joined(separator: "\n")
    )
}