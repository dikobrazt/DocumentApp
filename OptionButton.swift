//
//  OptionButton.swift
//  Scanner
//
//  Created by Vladislav Tuleiko on 6.07.22.
//

import UIKit

final class OptionButton: FeedbackButton {
    
    var importAction: Import?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(importAction: Import) {
        super.init()
        self.importAction = importAction
        setupContent()
    }
    
    override func setupContent() {
        super.setupContent()
        setBackgroundColor(Asset.Colors.darkSlateBlueFive.color, for: .normal)
        iconLocation = .attachedRight
        setTitle(importAction?.title, for: .normal)
        setImage(importAction?.image, for: .normal)
        contentHorizontalAlignment = .left
        imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 20)
        titleEdgeInsets = .init(top: 0, left: 45, bottom: 0, right: 40)
        setTitleColor(Asset.Colors.white.color, for: .normal)
        titleLabel?.font = FontFamily.Gilroy.medium.font(size: 16)
        semanticContentAttribute = .forceRightToLeft
    }
}
