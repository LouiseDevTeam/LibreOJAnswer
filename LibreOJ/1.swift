//
//  1.swift
//  LibreOJ
//
//  Created by Louis Shen on 2021/2/3.
//

import Foundation

struct One {
    public static func main() {
        var a : CInt = 0
        var b : CInt = 0
        _ = withUnsafeMutablePointer(to: &a) { ptr in
            withVaList([ptr]) { vaList in
                vscanf("%d", vaList)
            }
        }
        _ = withUnsafeMutablePointer(to: &b) { ptr in
            withVaList([ptr]) { vaList in
                vscanf("%d", vaList)
            }
        }
        print(a + b)
    }
}
