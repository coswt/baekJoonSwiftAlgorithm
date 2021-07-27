import Foundation

let n: Int = Int(readLine()!)!
let N: Int = n - 1

var sum: Int = 0
var arr: [Int] = Array(repeating: 0, count: n)

var count: [Int:Int] = [:] //
var mode = 0 //

for i in 0..<n {
    arr[i] = Int(readLine()!)!
    sum += arr[i]
    
    count[arr[i]] = ( count[arr[i]] != nil ? count[arr[i]]! : 0 ) + 1 //
    mode = mode < count[arr[i]]! ? count[arr[i]]! : mode //
}

let filtered = count.filter{ $0.value == mode } //
let countSorted = filtered.sorted{ $0.key < $1.key } //



print(round(Double(sum) / Double(n)))
print(arr.sorted()[N / 2])
print(countSorted[countSorted.count > 1 ? 1 : 0].key) //
print(arr.max()! - arr.min()!)
