//
//  OptionsView.swift
//  Scanner
//
//  Created by Vladislav Tuleiko on 5.07.22.
//

import UIKit
import SnapKit

final class OptionsView: View {

    var actionClosure: ((Import) -> Void)?
    
    let buttons: [OptionButton] = Import.allCases.compactMap { imp in
        let button = OptionButton(importAction: imp)
        button.addTarget(self,
                         action: #selector(buttonTapped(sender:)),
                         for: .touchUpInside)
        return button
    }
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()

    override func arrangeSubviews() {
        super.arrangeSubviews()
        self.addSubview(stackView)
    }
    
    override func setupViewConstraints() {
        super.setupViewConstraints()
        
        stackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
}



//MARK: - Actions
extension OptionsView {
    @objc private func buttonTapped(sender: OptionButton) {
        guard let action = sender.importAction else { return }
        actionClosure?(action)
    }
}

