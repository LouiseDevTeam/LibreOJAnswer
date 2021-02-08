//
//  10000.swift
//  LibreOJ
//
//  Created by Louis Shen on 2021/2/8.
//

import Foundation

struct _10000 {
    public static func main() {
        var len : CInt = 0
        _ = withUnsafeMutablePointer(to: &len) { ptr in
            withVaList([ptr]) { vaList in
                vscanf("%d", vaList)
            }
        }
        var array = [_10000Event]()
        let bitset = UnsafeMutablePointer<CBool>.allocate(capacity: 1998)
        for _ in 0 ..< len {
            var s : CInt = 0
            var f : CInt = 0
            _ = withUnsafeMutablePointer(to: &s) { ptr in
                withVaList([ptr]) { vaList in
                    vscanf("%d", vaList)
                }
            }
            _ = withUnsafeMutablePointer(to: &f) { ptr in
                withVaList([ptr]) { vaList in
                    vscanf("%d", vaList)
                }
            }
            array.append(_10000Event(s: s, f: f))
        }
        var heap = _10000BinaryHeap<_10000Event>(array: array)
        heap.heapSort()
        array = heap.getHeap()
        var maximum : CInt = 0
        for i in 0 ..< len {
            maximum = max(maximum, max(array[Int(i)].s, array[Int(i)].f))
        }
        var cnt = 0
        var ans = 0
        var isUsed = false
        for i in 0 ..< len {
            for j in 0 ... maximum {
                bitset[Int(j)] = false
            }
            for j in array[Int(i)].s ... array[Int(i)].f {
                bitset[Int(j)] = true
            }
            cnt = 0
            for j in 0 ..< len {
                isUsed = false
                if i == j {
                    continue
                }
                for k in array[Int(j)].s ..< array[Int(j)].f {
                    if bitset[Int(k)] == true {
                        isUsed = true
                        break
                    }
                }
                if isUsed == false {
                    cnt += 1
                    for k in array[Int(j)].s ... array[Int(j)].f {
                        bitset[Int(k)] = true
                    }
                }
            }
            ans = max(ans, cnt)
        }
        print(ans + 1)
    }
}

struct _10000Event : _10000Constructable, Comparable {
    public var s : CInt
    public var f : CInt
    
    init() {
        s = 0
        f = 0
    }
    
    init(s : CInt,
         f : CInt) {
        self.s = s
        self.f = f
    }
    
    static func < (lhs: _10000Event, rhs: _10000Event) -> Bool {
        return lhs.f < rhs.f
    }
}

struct _10000BinaryHeap<T : Comparable & _10000Constructable> {
    private var array : UnsafeMutablePointer<T>
    private var count : Int
    private var size : Int
    
    init() {
        array = UnsafeMutablePointer<T>.allocate(capacity: 1)
        count = 0
        size = 0
        array[0] = T()
    }
    
    init(array : [T]) {
        self.array = UnsafeMutablePointer<T>.allocate(capacity: array.count + 1)
        count = array.count
        size = count
        self.array[0] = T()
        for i in 1 ... array.count {
            self.array[i] = array[i - 1]
        }
        
        for i in (1 ... (count >> 1)).reversed() {
            maxHeapify(i)
        }
    }
    
    public mutating func getHeap() -> [T] {
        var res = [T]()
        for i in 1 ... size {
            res.append(array[i])
        }
        
        return res
    }
    
    private func parent(_ index : Int) -> Int {
        return index >> 1
    }
    
    private func left(_ index : Int) -> Int {
        return index << 1
    }
    
    private func right(_ index : Int) -> Int {
        return (index << 1) + 1
    }
    
    private mutating func maxHeapify(_ index : Int) {
        let l = left(index)
        let r = right(index)
        var largest = 0
        
        if l <= count && array[l] > array[index] {
            largest = l
        } else {
            largest = index
        }
        
        if r <= count && array[r] > array[largest] {
            largest = r
        }
        
        if largest != index {
            let delta = array[index]
            array[index] = array[largest]
            array[largest] = delta
            maxHeapify(largest)
        }
    }
    
    public mutating func heapSort() {
        for i in (2 ... count).reversed() {
            let delta = array[1]
            array[1] = array[i]
            array[i] = delta
            count -= 1
            maxHeapify(1)
        }
    }
}

protocol _10000Constructable {
    init()
}
