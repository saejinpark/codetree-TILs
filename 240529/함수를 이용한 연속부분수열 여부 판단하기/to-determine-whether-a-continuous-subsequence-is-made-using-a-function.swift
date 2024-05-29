import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if temp.count != nums.count { return nil }
    return nums
}

func solution(component: (Int, Int, [Int], [Int])) -> String {
    let (a, b, nums1, nums2) = component
    if b > a { return "No" }
    for i in 0...(a - b) {
        var testCase = true
        for j in 0..<b {
            if nums1[i + j] != nums2[j] {
                testCase = false
                break
            }
        }
        if testCase {
            return "Yes"
        }
    }
    return "No"
}

func main() {
    guard let ab = readNums() else { return }
    if ab.count != 2 { return }
    let (a, b) = (ab[0], ab[1])
    guard let nums1 = readNums(), let nums2 = readNums() else { return }
    print((a, b, nums1, nums2) |> solution)
}

main()