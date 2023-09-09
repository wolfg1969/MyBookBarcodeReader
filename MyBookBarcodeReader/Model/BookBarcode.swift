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
}
