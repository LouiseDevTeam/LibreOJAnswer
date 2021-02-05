//
//  5.swift
//  LibreOJ
//
//  Created by Louis Shen on 2021/2/5.
//

import Foundation

struct Five {
    private static var PI : Double = 3.141592653589793
    
    public static func main() {
        /*for i in 1 ... 1231 {
            if i * (i - 31) == 815184 - i {
                print(i)
                break
            }
        }*/
        
        for i in 1 ... 20021231 {
            if pow(a: i, b: i, mod: 911) + (i ^ (i % 1248679)) == 20000000 {
                print(i)
                break
            }
        }
        
        /*for i in 1 ... 1234567890 {
            if (abs(2e9 - max(abs(Double(i) - 1e9), max(abs(Double(i) - 2e9), abs(Double(i) - 3e9)))) <= 10) {
                if (abs(sin(PI * Double((i + 25)) / 32)) <= 1e-8) {
                    print(i)
                    break
                }
            }
        }*/
    }
    
    private static func pow(a : Int, b : Int, mod : Int) -> Int {
        var ans = 1
        for _ in 0 ..< b {
            ans = (ans % mod) * (a % mod) % mod
        }
        return ans % mod
    }
}
