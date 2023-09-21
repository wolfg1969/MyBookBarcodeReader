//
//  BookBarcodeList.swift
//  MyBookBarcodeReader
//
//  Created by wolfg1969 on 2023/9/9.
//

import Foundation
import SwiftUI

struct BookBarcodeList: View {
    @ObservedObject var bookBarcodeStore: BookBarcodeStore
    var body: some View {
        
        let barcodes = bookBarcodeStore.getAllBarcodes()
            .enumerated().map({ $0 })
        
        List() {
            Section(header: Text("Books")) {
                ForEach(barcodes, id: \.1.self) { index, barcode in
                    BookBarcodeRow(index: index, barcode: barcode)
                }
            }
            
        }
    }
}


struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        BookBarcodeList(bookBarcodeStore: BookBarcodeStore())
    }
}

