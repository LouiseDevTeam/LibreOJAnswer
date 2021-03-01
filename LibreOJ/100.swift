//
//  100.swift
//  LibreOJ
//
//  Created by Louis Shen on 2021/2/28.
//

import Foundation

struct _100 {
    public static func main() {
        let MOD = Int64(1e9 + 7)
        var n = 0
        var p = 0
        var m = 0
        var delta : CInt = 0
        _ = withUnsafeMutablePointer(to: &delta) { ptr in
            withVaList([ptr]) { vaList in
                vscanf("%d", vaList)
            }
        }
        n = Int(delta)
        _ = withUnsafeMutablePointer(to: &delta) { ptr in
            withVaList([ptr]) { vaList in
                vscanf("%d", vaList)
            }
        }
        p = Int(delta)
        _ = withUnsafeMutablePointer(to: &delta) { ptr in
            withVaList([ptr]) { vaList in
                vscanf("%d", vaList)
            }
        }
        m = Int(delta)
        
        let A = UnsafeMutablePointer<Int64>.allocate(capacity: n * p)
        let B = UnsafeMutablePointer<Int64>.allocate(capacity: p * m)
        let C = UnsafeMutablePointer<Int64>.allocate(capacity: n * m)
        
        for i in 0 ..< n {
            for j in 0 ..< m {
                C[i * m + j] = 0
            }
        }
        
        for i in 0 ..< n {
            for j in 0 ..< p {
                _ = withUnsafeMutablePointer(to: &delta) { ptr in
                    withVaList([ptr]) { vaList in
                        vscanf("%d", vaList)
                    }
                }
                A[i * p + j] = Int64(delta)
                A[i * p + j] += MOD
                A[i * p + j] %= MOD
            }
        }
        
        for i in 0 ..< p {
            for j in 0 ..< m {
                _ = withUnsafeMutablePointer(to: &delta) { ptr in
                    withVaList([ptr]) { vaList in
                        vscanf("%d", vaList)
                    }
                }
                B[i * m + j] = Int64(delta)
                B[i * m + j] += MOD
                B[i * m + j] %= MOD
            }
        }
        
        for i in 0 ..< n {
            for j in 0 ..< m {
                for k in 0 ..< p {
                    C[i * m + j] += A[i * p + k] * B[k * m + j] % MOD
                    C[i * m + j] %= MOD
                }
            }
        }
        
        for i in 0 ..< n {
            for j in 0 ..< m {
                print(C[i * m + j], terminator: " ")
            }
            print()
        }
    }
}
