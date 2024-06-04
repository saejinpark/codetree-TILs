import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

class Product: CustomStringConvertible {
    var name: String
    var code: Int

    init(name: String, code: Int) {
        self.name = name
        self.code = code
    }

    var description: String {
        return "product \(code) is \(name)"
    }
}

func readProduct() -> Product? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    guard temp.count == 2, let code = Int(temp[1]) else { return nil }
    return Product(name: String(temp[0]), code: code)
}

func main() {
    guard let product = readProduct() else { return }
    let codetree = Product(name: "codetree", code: 50)
    for i in [codetree, product] {
        print(i)
    }
}

main()