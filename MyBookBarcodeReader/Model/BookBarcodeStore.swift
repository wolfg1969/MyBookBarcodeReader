//
//  BookBarcodeStore.swift
//  MyBookBarcodeReader
//
//  Created by wolfg1969 on 2023/9/13.
//

import Foundation

class BookBarcodeStore: ObservableObject {
    
    static let _size: Int = 10
    
    @Published private var barcodes: [BookBarcode]
    private var currentSlot: Int = 0
    private var storeSize: Int = _size
    
    init() {
        self.barcodes = BookBarcodeStore.setUp()
    }
    
    func getAllValues() -> String {
        return self.barcodes.map() {$0.value}.joined(
            separator: "\n").trimmingCharacters(
                in: .newlines) + "\n"
    }
    
    func getAllBarcodes() -> [BookBarcode] {
        return self.barcodes
    }
    
    func add(value: String) {
        if (self.currentSlot < self.storeSize) {
            self.barcodes[currentSlot].value = value
        } else {
            self.barcodes.append(BookBarcode(value: value))
        }
        self.currentSlot += 1
    }
    
    func reset() {
        self.barcodes = BookBarcodeStore.setUp()
        self.currentSlot = 0
    }
    
    static func setUp() -> [BookBarcode] {
        return (0..<_size).map{ _ in BookBarcode(value: "") }
    }
}
