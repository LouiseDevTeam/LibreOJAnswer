//
//  100.swift
//  LibreOJ
//
//  Created by Louis Shen on 2021/2/28.
//

import Foundation

struct _100 {
    //c_ij=\sum_k=1^n a_{ik} b_{kj}
    public static func main() {
        let MOD : CInt = CInt(1e9 + 7)
        var n : CInt = 0
        var p : CInt = 0
        var m : CInt = 0
        _ = withUnsafeMutablePointer(to: &n) { ptr in
            withVaList([ptr]) { vaList in
                vscanf("%d", vaList)
            }
        }
        _ = withUnsafeMutablePointer(to: &p) { ptr in
            withVaList([ptr]) { vaList in
                vscanf("%d", vaList)
            }
        }
        _ = withUnsafeMutablePointer(to: &m) { ptr in
            withVaList([ptr]) { vaList in
                vscanf("%d", vaList)
            }
        }
        
        let A = UnsafeMutablePointer<CInt>.allocate(capacity: Int(n * p))
        let B = UnsafeMutablePointer<CInt>.allocate(capacity: Int(p * m))
        let C = UnsafeMutablePointer<CInt>.allocate(capacity: Int(n * m))
        
        for i in 0 ..< n {
            for j in 0 ..< p {
                _ = withUnsafeMutablePointer(to: &A[Int(i * p + j)]) { ptr in
                    withVaList([ptr]) { vaList in
                        vscanf("%d", vaList)
                    }
                }
            }
        }
        
        for i in 0 ..< p {
            for j in 0 ..< m {
                _ = withUnsafeMutablePointer(to: &B[Int(i * m + j)]) { ptr in
                    withVaList([ptr]) { vaList in
                        vscanf("%d", vaList)
                    }
                }
            }
        }
        
        for i in 0 ..< n {
            for j in 0 ..< m {
                for k in 0 ..< n {
                    C[Int(i * m + j)] += A[Int(i * p + k)] * B[Int(k * m + j)] % MOD
                }
            }
        }
        
        for i in 0 ..< n {
            for j in 0 ..< m {
                print(C[Int(i * m + j)], terminator: " ")
            }
            print()
        }
    }
}
