import Foundation

struct Candidate {
    var num: Int
    var recommendation: Int
    var time: Int
}

let N = Int(readLine()!)!
let M = Int(readLine()!)!

var count: Int = 0
var canstrucarr: [Candidate] = []
var queue: [Candidate] = []

var recnumarr: [Int] = Array(repeating: 0, count: M)
recnumarr = readLine()!.split(separator: " ").map {Int($0)!}

for i in 1...100 {
    canstrucarr.append(Candidate(num: i, recommendation: 0, time: 0))
}
for i in 0..<M {
    for j in 0..<queue.count {
        if recnumarr[i] == queue[j].num {
            count = 1
        }
        else {
            continue
        }
    }
    if count != 0 {
        canstrucarr[recnumarr[i]-1].recommendation += 1
        for k in 0..<queue.count {
            if canstrucarr[recnumarr[i]-1].num == queue[k].num {
                queue[k].recommendation += 1
            }
        }
        count = 0
    }
    else if queue.count < N {
        canstrucarr[recnumarr[i]-1].recommendation += 1
        canstrucarr[recnumarr[i]-1].time = i
        queue.append(canstrucarr[recnumarr[i]-1])
    }
    else {
        queue = queue.sorted(by: { a, b in
            if a.recommendation == b.recommendation {
                return a.time < b.time
            }
            else {
                return a.recommendation < b.recommendation
            }
        })
        for k in 0...99 {
            if queue[0].num == canstrucarr[k].num {
                canstrucarr[k].recommendation = 0
            }
        }
        queue.removeFirst()
        canstrucarr[recnumarr[i]-1].recommendation += 1
        canstrucarr[recnumarr[i]-1].time = i
        queue.append(canstrucarr[recnumarr[i]-1])
    }
}

var queuenum: [Int] = []
for i in 0..<queue.count {
    queuenum.append(queue[i].num)
}

queuenum = queuenum.sorted()

for element in queuenum {
  print(element, terminator: " ")
}
