//
//  10001.swift
//  LibreOJ
//
//  Created by Louis Shen on 2021/2/10.
//

import Foundation

struct _10001 {
    public static func main() {
        var len : CInt = 0
        _ = withUnsafeMutablePointer(to: &len) { ptr in
            withVaList([ptr]) { vaList in
                vscanf("%d", vaList)
            }
        }
        
        var h : CInt = 0
        _ = withUnsafeMutablePointer(to: &h) { ptr in
            withVaList([ptr]) { vaList in
                vscanf("%d", vaList)
            }
        }
        
        let b = UnsafeMutablePointer<Int>.allocate(capacity: Int(h))
        let e = UnsafeMutablePointer<Int>.allocate(capacity: Int(h))
        let t = UnsafeMutablePointer<Int>.allocate(capacity: Int(h))
        let tree = UnsafeMutablePointer<CBool>.allocate(capacity: Int(len) + 1)
        
        for i in 0 ..< h {
            _ = withUnsafeMutablePointer(to: &b[Int(i)]) { ptr in
                withVaList([ptr]) { vaList in
                    vscanf("%d", vaList)
                }
            }
            _ = withUnsafeMutablePointer(to: &e[Int(i)]) { ptr in
                withVaList([ptr]) { vaList in
                    vscanf("%d", vaList)
                }
            }
            _ = withUnsafeMutablePointer(to: &t[Int(i)]) { ptr in
                withVaList([ptr]) { vaList in
                    vscanf("%d", vaList)
                }
            }
        }
        
        for i in 0 ..< len {
            tree[Int(i)] = false
        }
        
        var cnt = 0
        for i in 0 ..< len {
            tree[Int(i)] = true
            for j in 0 ..< h {
                cnt = 0
                //print("\(b[Int(j)]) \(e[Int(j)])")
                for k in b[Int(j)] ... e[Int(j)] {
                    if tree[k] {
                        cnt += 1
                    }
                    if cnt >= t[k] {
                        break;
                    }
                }
            }
        }
        
        cnt = 0
        for i in 0 ..< len {
            if tree[Int(i)] {
                cnt += 1
            }
        }
        print(cnt)
    }
}
