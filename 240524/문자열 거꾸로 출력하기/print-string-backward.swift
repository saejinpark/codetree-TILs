import Foundation

extension String {
    func reverseString() -> String {
        let arr = Array(self).map(String.init)
        return arr.reversed().joined(separator: "")
    }
}

func main() {
    var arr: [String] = []
    
    while true {
        guard let str = readLine() else { return }
        if str == "END" {
            print(arr.joined(separator: "\n"))
            break
        }
        arr.append(str.reverseString())
    }
}

main()