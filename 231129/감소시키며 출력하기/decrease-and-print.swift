import Foundation

print(stride(from: 17, to: 4, by: -1).map{String($0)}.joined(separator: " "))