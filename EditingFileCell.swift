//
//  EditingFileCell.swift
//  Scanner
//
//  Created by Vladislav Tuleiko on 20.06.22.
//

import Foundation
import SnapKit



final class EditingFileCell: UICollectionViewCell {
    
    private let fileImageView: UIImageView = {
        let fileImageView = UIImageView()
        fileImageView.image = Asset.Images.Files.doc.image
        fileImageView.cornerRadius = 5
        return fileImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Asset.Colors.white.color
        cornerRadius = 5
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



//MARK: - Make Constraints
extension EditingFileCell {
    private func makeConstraints() {
        addSubview(fileImageView)
        fileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(7)
            make.top.equalToSuperview().inset(7)
            make.trailing.equalToSuperview().inset(7)
            make.bottom.equalToSuperview().inset(69)
        }
    }
}



//MARK: - Configure
extension EditingFileCell {
    
    func configure(with imageOfPage: EditingItem){
        fileImageView.image = imageOfPage.image
    }
}




