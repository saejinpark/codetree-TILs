import Foundation

let m = Int(readLine()!)!

switch m {
    case 3...5:
        print("Spring")
        break
    case 6...8:
        print("Summer")
        break
    case 9...11:
        print("Fall")
        break
    default:
        print("Winter")
}