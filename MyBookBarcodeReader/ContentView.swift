//
//  ContentView.swift
//  MyBookBarcodeReader
//
//  Created by wolfg1969 on 2023/9/9.
//
import AVFoundation
import SwiftUI
import CodeScanner

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(30)
            .background(Color(red: 0, green: 0.5, blue: 0.5))
            .foregroundStyle(.white)
            .clipShape(Circle())
    }
}

struct ContentView: View {
    //initialize the scanner as off
    @State var isPresentingScanner = false
    @State var scannedCodes: [BookBarcode] = initBookBarcodes;
    @State var currentSlot: Int = 0;
    
    var body: some View {
        //now use VStack to vertically place views inside
        //set up spacing
        VStack(spacing: 10){
            CodeScannerView(
                codeTypes: [.ean13],
                scanMode: .continuous,
                // scanInterval: 10,
                showViewfinder: false,
                completion: { result in
                    if case let .success(code) = result{
                        var barcode = BookBarcode(value: code.string)
                        if (self.currentSlot < 10) {
                            self.scannedCodes[currentSlot] = barcode
                        } else {
                            self.scannedCodes.append(barcode)
                        }
                        self.currentSlot += 1
                    }
                    
                }
                
            )
            BookBarcodeList(bookBarcodes: self.scannedCodes)
            Spacer()
            Spacer()
            HStack(spacing: 10) {
                Button("Copy") {
                    print("Copy Button pressed!")
                    UIPasteboard.general.string = self.scannedCodes.map() {$0.value}.joined(separator: "\n")
                    // kSystemSoundID_Vibrate
                    AudioServicesPlayAlertSound(SystemSoundID(1300))
//                    self.scannedCodes.removeAll()
                }
                .buttonStyle(CustomButtonStyle())
                
                Button("Clear") {
                    print("Clear Button pressed!")
                    self.scannedCodes = initBookBarcodes
                    self.currentSlot = 0
                    AudioServicesPlayAlertSound(SystemSoundID(1301))
                }
                .buttonStyle(CustomButtonStyle())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
