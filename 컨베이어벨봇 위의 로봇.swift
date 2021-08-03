import Foundation

func moveArrOneblock(_ arr: inout [Int], _ val: Int) {
    arr.insert(0, at: 0)
    let lastnum = arr[val]
    arr.removeLast()
    arr[0] = lastnum
}

var count: Int = 1

var arrNK: [Int] = Array(repeating: 0, count: 2) // 컴파일 에러
arrNK = readLine()!.split(separator: " ").map { Int($0)! }

let N = arrNK[0]
let K = arrNK[1]
let num = 2 * N

var arrdura: [Int] = Array(repeating: 0, count: num) // 컴파일에러
arrdura = readLine()!.split(separator: " ").map { Int($0)! }

var arrRpos: [Int] = Array(repeating: 0, count: N) // 컴파일 에러

while(true) {
    var arrcount0: Int = 0
    var arrof1: [Int] = []
    
    moveArrOneblock(&arrdura, num)
    moveArrOneblock(&arrRpos, N)
    if arrRpos[N - 1] == 1 {
        arrRpos[N - 1] = 0
    } //1
    
    for (index, value) in arrRpos.enumerated() {
        if value == 1 {
            arrof1.append(index)
        }
    }
    
    arrof1 = arrof1.sorted(by:>)
    
    for i in 0..<arrof1.count {
        
        if arrof1[i] == N - 2 {
            if arrdura[arrof1[i] + 1] != 0 {
            arrRpos[arrof1[i]] = 0
            arrRpos[arrof1[i] + 1] = 0
            arrdura[arrof1[i] + 1] -= 1
            }
        }
        else {
            if arrRpos[arrof1[i] + 1] != 1 && arrdura[arrof1[i] + 1] != 0 {
                arrRpos[arrof1[i] + 1] = 1
                arrdura[arrof1[i] + 1] -= 1
                arrRpos[arrof1[i]] = 0
            }
        }
    } //2
    
    if arrdura[0] != 0 {
        arrRpos[0] = 1
        arrdura[0] -= 1
    } //3
    
    for i in 0..<num {
        if arrdura[i] == 0 {
            arrcount0 += 1
        }
    }
    if arrcount0 > K - 1 {
        break
    }//4
    
    count += 1
    print(arrRpos)
    print(arrdura)
    print(arrof1)
    print(count)
}

print(count)

//참조: https://stackoverflow.com/questions/61484222/how-to-return-multiple-array-element-index-values-as-an-int-in-swift-4

// https://stackoverflow.com/questions/24781027/how-do-you-sort-an-array-of-structs-in-swift
