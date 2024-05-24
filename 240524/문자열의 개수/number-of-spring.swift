import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U{
    return function(value)
}


func main() {
    var arr = [String]()
    while true {
        guard let line = readLine() else { return }
        if line == "0" { break }
        arr.append(line)
    }
    if arr.count == 0 {
        print("0")
        return
    }
    let oddLine = arr
            .enumerated()
            .filter{(index, elem) in 
                index % 2 == 0
            }
            .map{(index, elem) in 
                elem
            }
            .joined(separator: "\n")

    print("\(arr.count)\n\(oddLine)")
}

main()