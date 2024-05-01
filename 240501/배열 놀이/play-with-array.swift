import Foundation


precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U ) -> U {
    return function(value)
}

enum VaginalType: Int {
    case first = 1
    case second = 2
    case third = 3
}

class Vaginal {
    var type:VaginalType
    var a:Int?
    var b:Int?
    var s:Int?
    var e:Int?

    init?(_ line: String) {
        let temp = line.split(separator: " ")
        let components = temp.compactMap({Int($0)})
        guard let typeCode = components.first,
              let type = VaginalType(rawValue: typeCode)
        else { return nil }
        self.type = type
        switch type {
            case VaginalType.first:
                if components.count != 2 { return nil }
                self.a = components[1]
            case VaginalType.second:
                if components.count != 2 { return nil }
                self.b = components[1]
            case VaginalType.third:
                if components.count != 3 { return nil }
                self.s = components[1]
                self.e = components[2]
            default:
                return nil
        }
    }
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    return temp.count == nums.count ? nums : nil
}

func solution(_ nums:[Int], _ lines:[String] ) -> String {
    var results:[String] = []

    var numDict:[Int:Int] = [:]
    for i in stride(from: nums.count - 1, to: -1, by:-1) {
        numDict[nums[i]] = i + 1
    }

    func addResult(vaginal:Vaginal) {
        switch vaginal.type {
            case .first:
                results.append(String(vaginal.a!))
            case .second:
                if let elem = numDict[vaginal.b!] {
                    results.append(String(elem))
                } else {
                    results.append("0")
                }
            case .third:
                let result = nums[(vaginal.s! - 1)...(vaginal.e! - 1)]
                            .map{ String($0) }
                            .joined(separator: " ")
                results.append(result)
        }
    }

    for line in lines {
        guard let vaginal = Vaginal(line) else { return "None" }
        vaginal |> addResult
    }

    return results.joined(separator: "\n")
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