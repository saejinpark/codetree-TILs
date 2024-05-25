import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func main() {
    func printTenStars() {
        print("**********")
    }
    for i in 1...5 {
        printTenStars()
    }
}

main()