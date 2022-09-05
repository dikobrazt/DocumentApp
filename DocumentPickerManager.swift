//
//  DocumentPickerManager.swift
//  Scanner
//
//  Created by Vladislav Tuleiko on 9.06.22.
//

import Foundation
import UIKit
import UniformTypeIdentifiers


final class DocumentPickerManager: NSObject {
    
    private let pdfManager: PDFManager
    private let documentPicker = UIDocumentPickerViewController.init(forOpeningContentTypes: [.pdf, .image], asCopy: true)
    
    init(pdfManager: PDFManager) {
        self.pdfManager = pdfManager
        super.init()
        
        documentPicker.delegate = self
    }
}



//MARK: - UIDocumentPickerDelegate
extension DocumentPickerManager: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        pdfManager.convertPDFIntoImage(url: urls)
    }
}



//MARK: - Present
extension DocumentPickerManager {
    func presentDocumentPicker(viewController: UIViewController) {
        viewController.present(documentPicker, animated: true)
    }
}
