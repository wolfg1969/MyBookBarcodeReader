//
//  BookBarcodeList.swift
//  MyBookBarcodeReader
//
//  Created by wolfg1969 on 2023/9/9.
//

import Foundation
import SwiftUI

struct BookBarcodeList: View {
    var bookBarcodes: [BookBarcode]
    var body: some View {
        List(bookBarcodes) { barcode in
            BookBarcodeRow(barcode: barcode)
        }
    }
}


struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        BookBarcodeList(bookBarcodes: [])
    }
}

