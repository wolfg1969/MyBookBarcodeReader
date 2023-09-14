//
//  BookBarcode.swift
//  MyBookBarcodeReader
//
//  Created by wolfg1969 on 2023/9/9.
//

import Foundation

struct BookBarcode: Hashable, Codable, Identifiable {
    var id = UUID()
    var value: String
    var label: String {
        if (value.count == 13) {
            var start = value.index(value.startIndex, offsetBy: 0)
            var end = value.index(value.startIndex, offsetBy: 3)
            var ret = String(value[start..<end])
            ret += "-"
            start = value.index(value.startIndex, offsetBy: 3)
            end = value.index(value.startIndex, offsetBy: 3)
            ret += String(value[start...end])
            ret += "-"
            start = value.index(value.startIndex, offsetBy: 4)
            end = value.index(value.startIndex, offsetBy: 6)
            ret += String(value[start...end])
            ret += "-"
            start = value.index(value.startIndex, offsetBy: 7)
            end = value.index(value.endIndex, offsetBy: -2)
            ret += String(value[start...end])
            ret += "-"
            start = value.index(value.endIndex, offsetBy: -1)
            end = value.index(value.endIndex, offsetBy: -1)
            ret += String(value[start...end])
            
            return ret
        }
        return value
    }
}
