//
//

import ApphudSDK
import RxCocoa
import RxSwift
import ObjectiveC
import UIKit
import Photos



final class FilesViewModel: NSObject {
    
    private let pdfManager: PDFManager
    private lazy var documentScannerManager = DocumentScannerManager()
    private lazy var documentPickerManager = DocumentPickerManager(pdfManager: pdfManager)
    private lazy var imagePickerManager = ImagePickerManager()
    var snapshotUpdated: ((NSDiffableDataSourceSnapshot<EditingSection, EditingItem>) -> ())?
    var infoTransition: VoidClosure?
    
    init(pdfManager: PDFManager) {
        self.pdfManager = pdfManager
        super.init()
        
        pdfManager.convertedFiles = { [ weak self ] img in
            guard let snapshot = self?.reloadData(imagesSection: EditingSection(items: img)) else { return }
            self?.snapshotUpdated?(snapshot)
        }
        
        imagePickerManager.selectedImages = { [ weak self ] img in
            print(img)
            guard let snapshot = self?.reloadData(imagesSection: EditingSection(items: img)) else { return }
            self?.snapshotUpdated?(snapshot)
        }
        
        documentScannerManager.scannedImages = { [ weak self ] img in
            print(img)
            guard let snapshot = self?.reloadData(imagesSection: EditingSection(items: img)) else { return }
            self?.snapshotUpdated?(snapshot)
        }
    }
    
    func reloadData(imagesSection: EditingSection) -> NSDiffableDataSourceSnapshot<EditingSection, EditingItem> {
        var snapshot = NSDiffableDataSourceSnapshot<EditingSection, EditingItem>()
        snapshot.appendSections([imagesSection])
        snapshot.appendItems(imagesSection.items, toSection: imagesSection)
        return snapshot
    }
}



//MARK: - Present controllers
extension FilesViewModel {
    
    func presentDocumentPicker(viewController: UIViewController) {
        documentPickerManager.presentDocumentPicker(viewController: viewController)
    }
    
    func presentImagePicker(viewController: UIViewController) {
        imagePickerManager.presentImagePicker(viewController: viewController)
    }
    
    func presentDocumentScanner(viewController: UIViewController) {
        documentScannerManager.presentDocumentScanner(with: viewController)
    }
    
    func presentInfoViewController() {
        infoTransition?()
    }
}










