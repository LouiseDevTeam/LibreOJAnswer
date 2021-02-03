//
//  3.swift
//  LibreOJ
//
//  Created by Louis Shen on 2021/2/3.
//

import Foundation

struct Three {
    public static func main() {
        freopen("copycat.in", "r", stdin)
        freopen("copycat.out", "w", stdout)
        var len : CInt = 0
        _ = withUnsafeMutablePointer(to: &len) { ptr in
            withVaList([ptr]) { vaList in
                vscanf("%d\n", vaList)
            }
        }
        
        var data = [String]()
        while let line = readLine() {
            data.append(line)
        }
        
        for i in data {
            print(i)
        }
    }
}
