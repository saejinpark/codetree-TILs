import Foundation

class Info {
    var sym = false
    var tem = 0

    init(sym : Bool, tem : Int) {
        self.sym = sym
        self.tem = tem
    }
}

func input() -> Info {
    let arr = readLine()!.split(separator: " ")
    return  Info(sym: arr[0] == "Y" ? true : false, tem: Int(arr[1])!) 
}
var count = 0

for info in [input(), input(), input()] {
    count = info.sym && info.tem >= 37 ? count + 1 : count 
}

print(count >= 2 ? "E" : "N")