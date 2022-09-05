//
//  EditingModel.swift
//  Scanner
//
//  Created by Vladislav Tuleiko on 19.06.22.
//

import Foundation
import UIKit



struct EditingItem: Hashable {
    let image: UIImage
}

struct EditingSection: Hashable {
    var items: [EditingItem]
}

