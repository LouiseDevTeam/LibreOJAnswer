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
        //918
        for i in 1 ... 1231 {
            if i * (i - 31) == 815184 - i {
                print(i)
                break
            }
        }
        
        //20010911
        for i in 1 ... 20021231 {
            if pow(a: i, b: i, mod: 911) + (i ^ (i % 1248679)) == 20000000 {
                print(i)
                break
            }
        }
        
        //1000000007
        for i in 1 ... 1234567890 {
            if (abs(2e9 - max(abs(Double(i) - 1e9), max(abs(Double(i) - 2e9), abs(Double(i) - 3e9)))) <= 10) {
                if (abs(sin(PI * Double((i + 25)) / 32)) <= 1e-8) {
                    print(i)
                    break
                }
            }
        }
        
        //121919171932
        var x : Int64 = 0
        let len : Int64 = 1463030063184
        while x <= len {
            let alpha = x & -x
            let beta = x - alpha
            if x * (alpha + (beta & -beta)) == len {
                print(x)
                break
            }
            x += 1
        }
        
        //1
        print(1)
    }
    
    private static func pow(a : Int, b : Int, mod : Int) -> Int {
        if b == 0 {
            return 1
        }
        
        let res = pow(a: a, b: b >> 1, mod: mod)
        
        if b % 2 == 0 {
            return res * res % mod
        } else {
            return res * res * a % mod
        }
    }
}
