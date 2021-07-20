func removeDuplication(in array: [Int]) -> [Int]{
    let set = Set(array)
    return Array(set)
}

import Foundation

let number = Int(readLine()!)!
let list = Int(readLine()!)!

var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: list) // Q : 꼭 필요한가?
var arr1: [Int] = []

for i in 0...list - 1 {
    arr[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

for i in 0...list - 1 {
    if arr[i][0] == 1 {
        arr1.append(arr[i][1])
    }
    else {
        continue
    }
}

let number1 = arr1.count

for i in 0...number1 - 1 {
    for j in 0...list - 1 {
        for k in 0...1 {
            if arr1[i] == arr[j][k] {
                arr1.append(arr[j][abs(k-1)])
            }
            else {
                continue
            }
        }
    }
}

arr1.removeAll {$0 == 1}

let number2 = removeDuplication(in: arr1).count // Q : 새로운 배열 정의 방법

print(number2)
