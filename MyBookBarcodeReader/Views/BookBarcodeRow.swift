//
//  BookBarcodeRowView.swift
//  MyBookBarcodeReader
//
//  Created by wolfg1969 on 2023/9/9.
//

import Foundation
import SwiftUI

struct BookBarcodeRow: View {
    var index: Int
    var barcode: BookBarcode
    
    var body: some View {
        HStack(spacing: 5) {
            Spacer()
            Text(String(index + 1))
            Spacer()
            Text(barcode.label)
                .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
        }
    }
}

struct BookBarcodeRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BookBarcodeRow(index: 0, barcode: BookBarcode(value: "9787544257329"))
            BookBarcodeRow(index: 1, barcode: BookBarcode(value: "9787544257330"))
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
