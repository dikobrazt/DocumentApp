//
//  PDFManager.swift
//  Scanner
//
//  Created by Vladislav Tuleiko on 19.06.22.
//

import Foundation
import PDFKit



final class PDFManager: Resolvable {
    
    var convertedFiles: (([EditingItem]) -> ())?
    
    func convertPDFIntoImage(url: [URL]?) /*completionHandler: ([EditingItem])*/ -> Void {
        guard let url = url?.first, let document = PDFDocument(url: url) else { return }
        
        let pageCount = document.pageCount
        let images: [EditingItem] = (0...pageCount - 1).compactMap { page in
            let sheet = document.page(at: page)
            guard let pageRect = sheet?.bounds(for: .mediaBox) else { return nil }
            let render = UIGraphicsImageRenderer(size: pageRect.size)
            
            let image = render.image { ctx in
                UIColor.white.set()
                
                ctx.fill(CGRect(x: 0,
                                y: 0,
                                width: pageRect.width,
                                height: pageRect.height))
                ctx.cgContext.translateBy(x: -pageRect.origin.x,
                                          y: pageRect.size.height - pageRect.origin.y)
                ctx.cgContext.scaleBy(x: 1.0, y: -1.0)
                
                sheet?.draw(with: .mediaBox, to: ctx.cgContext)
            }
           return EditingItem(image: image)
        }
        convertedFiles?(images)
        //completionHandler(images)
    }
}
