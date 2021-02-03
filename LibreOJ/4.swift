//
//  4.swift
//  LibreOJ
//
//  Created by Louis Shen on 2021/2/3.
//

import Foundation

struct Four {
    public static func main() {
        let mark = String(bytes: [34], encoding: .utf8)
        let comma = String(bytes: [44], encoding: .utf8)
        let source = [
        "//",
        "//  4.swift",
        "//  LibreOJ",
        "//",
        "//  Created by Louis Shen on 2021/2/3.",
        "//",
        "",
        "import Foundation",
        "",
        "struct Four {",
        "    public static func main() {",
        "        let mark = String(bytes: [34], encoding: .utf8)",
        "        let comma = String(bytes: [44], encoding: .utf8)",
        "        let source = [",
        "        ",
        "        ]",
        "",
        "        for i in 0 ... 13 {",
        "            print(source[i])",
        "        }",
        "",
        "        for i in source {",
        "            print(source[14] + mark! + i + mark! + comma!)",
        "        }",
        "",
        "        for i in 15 ..< source.count {",
        "            print(source[i])",
        "        }",
        "    }",
        "}",
        "",
        "Four.main()",
        ]

        for i in 0 ... 13 {
            print(source[i])
        }

        for i in source {
            print(source[14] + mark! + i + mark! + comma!)
        }

        for i in 15 ..< source.count {
            print(source[i])
        }
    }
}
