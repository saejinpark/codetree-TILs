import Foundation

let (cm, kg) = {
    let nums = readLine()!.split(separator: " ").map{i in Int(i)!}
    return (nums.first!, nums.last!)
}()

let bmi = Int(Float(kg) / (Float(cm * cm) / 100 / 100))

print(bmi)

if bmi > 25 {
    print("Obesity")
}