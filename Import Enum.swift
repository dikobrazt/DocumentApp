//
//  Import Enum.swift
//  Scanner
//
//  Created by Vladislav Tuleiko on 7.07.22.
//

import UIKit

enum Import: CaseIterable {
    case scanDocument, printDocument, printPhoto
    
    var image: UIImage {
        switch self {
        case .scanDocument:
            return Asset.Images.Files.scanIcon.image
        case .printDocument:
            return Asset.Images.Files.newBlankIcon.image
        case .printPhoto:
            return Asset.Images.Files.importPhotoIcon.image
        }
    }
    
    var title: String {
        switch self {
        case .scanDocument:
            return "Scan Document"
        case .printDocument:
            return "Print Document"
        case .printPhoto:
            return "Print Photo"
        }
    }
}
