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
            var ret = ["📘 ", "📗 ", "📙 "].randomElement()!
            ret += getBarcodePart(start: 0, end: 3) + "-"
            ret += getBarcodePart(start: 3, end: 4) + "-"
            ret += getBarcodePart(start: 4, end: 7) + "-"
            ret += getBarcodePart(start: 7, end: 12) + "-"
            ret += getBarcodePart(start: 12, end: 13)
            return ret
        }
        return value
    }
    
    private func getBarcodePart(start: Int, end: Int) -> String {
        let startIndex = value.index(value.startIndex, offsetBy: start)
        let endIndex = value.index(value.startIndex, offsetBy: end)
        return String(value[startIndex..<endIndex])
    }
}
