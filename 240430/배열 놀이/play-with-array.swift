import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U ) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    return temp.count == nums.count ? nums : nil
}

func solution(_ nums:[Int], _ lines:[String] ) -> String {
    var arr:[String] = []

    var numDict:[Int:Int] = [:]
    for i in stride(from: nums.count - 1, to: -1, by:-1) {
        numDict[nums[i]] = i + 1
    }

    for line in lines {
        let temp = line.split(separator: " ")
        switch temp.first {
            case "1":
                if let a = Int(temp[1]) {
                    arr.append(String(nums[a - 1]))
                }
            case "2":
                if let b = Int(temp[1]) {
                    if let elem = numDict[b] {
                        arr.append(String(elem))
                    } else {
                        arr.append("0")
                    }
                }
            case "3":
                if let s = Int(temp[1]), let e = Int(temp[2]) {
                    arr.append(
                            nums[(s - 1)...(e - 1)]
                                .map{ String($0) }
                                .joined(separator: " ")
                            )
                }
            default: return "None"
        }
    }

    return arr.joined(separator: "\n")
}

func main() {
    guard let temp = readNums() else { return }
    if temp.count != 2 { return }
    let (n, q) = temp |> { ($0.first!, $0.last!) }
    guard let nums = readNums() else { return }
    if n != nums.count { return } 
    let lines = (1...q).compactMap{_ in readLine() }
    if q != lines.count { return }
    print(solution(nums, lines))
}

main()