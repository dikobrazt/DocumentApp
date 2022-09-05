//
//  DocumentScannerManager.swift
//  Scanner
//
//  Created by Vladislav Tuleiko on 7.07.22.

import VisionKit
import UIKit

final class DocumentScannerManager: NSObject {
    
    private let documentScanner: VNDocumentCameraViewController = {
        let documentScanner = VNDocumentCameraViewController()
        return documentScanner
    }()
    var scannedImages: (([EditingItem]) -> ())?
   
    override init(){
        super.init()
        documentScanner.delegate = self
    }
}



//MARK: - VNDocumentCameraViewControllerDelegate
extension DocumentScannerManager: VNDocumentCameraViewControllerDelegate {
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        
        documentScanner.dismiss(animated: true)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        documentScanner.dismiss(animated: true)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        let images: [EditingItem] = (0..<scan.pageCount).compactMap { page in
            let image = scan.imageOfPage(at: page)
            return EditingItem(image: image)
        }
        scannedImages?(images)
        
        documentScanner.dismiss(animated: true)
    }
}



//MARK: - Present
extension DocumentScannerManager {
    func presentDocumentScanner( with viewController: UIViewController) {
        viewController.present(documentScanner, animated: true)
    }
}
