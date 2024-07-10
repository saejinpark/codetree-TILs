import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func solution(bit: String) -> Int {
    var bitArr = bit.split(separator: "").map(String.init)
    var zeroIndex = -1
    
    for i in 0..<bitArr.count {
        if bitArr[i] == "0" {
            zeroIndex = i
            break
        }
    }

    if zeroIndex == -1 {
        bitArr[bitArr.count - 1] = "0"
    } else {
        bitArr[zeroIndex] = "1"
    }

    return Int(bitArr.joined(separator: ""), radix: 2)!

}

func main() {
    guard let line = readLine() else { return }
    print(line |> solution)
}

main()