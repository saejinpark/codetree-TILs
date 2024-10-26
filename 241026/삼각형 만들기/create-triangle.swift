import Foundation

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    return temp.count == nums.count ? nums : nil
}

func readNumPair() -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums[0], nums[1])
}

func solution(_ input: [(Int, Int)]) -> Int {
    var answer = 0

    for i in 0..<(input.count - 2) {
        let p1 = input[i]

        for j in (i + 1)..<(input.count - 1) {
            let p2 = input[j]

            for k in (j + 1)..<input.count {
                let p3 = input[k]

                // x좌표가 같은 두 점과 y좌표가 같은 두 점이 있는지 확인
                if (p1.0 == p2.0 && p1.1 == p3.1) || 
                   (p1.0 == p3.0 && p1.1 == p2.1) || 
                   (p2.0 == p3.0 && p2.1 == p1.1) {

                    // 가로와 세로 길이를 계산
                    let width = abs(p1.0 - p3.0)
                    let height = abs(p1.1 - p2.1)
                    
                    // 최대 넓이를 갱신 (사각형 넓이에 2를 곱한 값)
                    answer = max(answer, width * height * 2)
                }
            }
        }
    }
    
    return answer
}

func main() {
    guard let n = readNum() else { return }
    let input = (1...n).compactMap({ _ in readNumPair() })
    print(solution(input))
}

main()