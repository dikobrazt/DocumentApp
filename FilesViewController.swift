//
//  OnboardingViewController.swift
//  BatteryCharger
//
//  Created by Kuprik Nikita on 1/8/21.
//  Copyright © 2021 Applace. All rights reserved.

import RxCocoa
import RxSwift
import Lottie
import SnapKit
import UIKit

final class FilesViewController: ViewController {
    
    private let headerLabel: UILabel = {
        let myFilesLabel = UILabel()
        myFilesLabel.font = FontFamily.Gilroy.bold.font(size: 34)
        myFilesLabel.text = "Printer"
        myFilesLabel.textColor = Asset.Colors.white.color
        return myFilesLabel
    }()
    
    private let infoButton: FeedbackButton = {
        let infoButton = FeedbackButton()
        infoButton.setImage(Asset.Images.Files.infoSquare.image, for: .normal)
        return infoButton
    }()
    
    private let detailedView: UIView = {
        let detailedView = UIView()
        detailedView.backgroundColor = Asset.Colors.lightPeriwinkleNine.color
        detailedView.cornerRadius = 28
        return detailedView
    }()
    
    private let addFileImageView: UIImageView = {
        let addFileImageView = UIImageView()
        addFileImageView.image = Asset.Images.Files.group5.image
        return addFileImageView
    }()
    
    private let toolsView: UIView = {
        let toolsView = UIView()
        toolsView.backgroundColor = .white
        toolsView.cornerRadius = 16
        return toolsView
    }()
    
    private let editButton: FeedbackButton = {
        let editButton = FeedbackButton()
        editButton.isEnabled = false
        editButton.setBackgroundColor(Asset.Colors.palegrey.color, for: .normal)
        editButton.setBackgroundColor(Asset.Colors.palegrey.color, for: .disabled)
        editButton.cornerRadius = 16
        editButton.titleLabel?.font = FontFamily.Gilroy.bold.font(size: 16)
        editButton.setTitleColor(Asset.Colors.liightbluegrey.color, for: .disabled)
        editButton.setTitleColor(Asset.Colors.salmon.color, for: .normal)
        editButton.setImage(Asset.Images.Files.group9.image.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
        editButton.setTintColor(Asset.Colors.liightbluegrey.color, for: .disabled)
        editButton.setTintColor(Asset.Colors.salmon.color, for: .normal)
        editButton.setTitle(" Edit", for: .normal)
        return editButton
    }()
    
    private let printButton: FeedbackButton = {
        let printButton = FeedbackButton()
        printButton.isEnabled = false
        printButton.setBackgroundColor(Asset.Colors.palegrey.color, for: .disabled)
        printButton.setBackgroundColor(Asset.Colors.salmon.color, for: .normal)
        printButton.cornerRadius = 16
        printButton.titleLabel?.font = FontFamily.Gilroy.bold.font(size: 16)
        printButton.setTitleColor(Asset.Colors.liightbluegrey.color, for: .disabled)
        printButton.setTitleColor(Asset.Colors.white.color, for: .normal)
        printButton.setImage(Asset.Images.Files.group.image.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
        printButton.setTintColor(Asset.Colors.liightbluegrey.color, for: .disabled)
        printButton.setTintColor(Asset.Colors.white.color, for: .normal)
        printButton.setTitle(" Print", for: .normal)
        return printButton
    }()
    
    private let addButton: FeedbackButton = {
        let addButton = FeedbackButton()
        addButton.show()
        addButton.setBackgroundColor(Asset.Colors.salmon.color, for: .normal)
        addButton.cornerRadius = 31
        addButton.setImage(Asset.Images.Files.addIcon.image, for: .normal)
        return addButton
    }()
    
    private let optionsView: OptionsView = {
        let optionsView = OptionsView()
        optionsView.backgroundColor = Asset.Colors.darkSlateBlueFive.color
        optionsView.cornerRadius = 21
        optionsView.hide()
        return optionsView
    }()
    
    private lazy var collectionView: UICollectionView = {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionView.backgroundColor = .blue //Asset.Colors.lightPeriwinkleNine.color
        collectionView.isPagingEnabled = true
        collectionView.register(EditingFileCell.self)//extension
        collectionView.hide()
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var dataSource:
    UICollectionViewDiffableDataSource<EditingSection, EditingItem> = {
        let dataSource = UICollectionViewDiffableDataSource<EditingSection, EditingItem>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(forClass: EditingFileCell.self, for: indexPath)
            cell.configure(with: itemIdentifier)
            return cell
        })
        return dataSource
    }()
    
    //MARK: - Functions
    
    var viewModel: FilesViewModel!
    
    override public var backgroundColor: UIColor {
        return Asset.Colors.darkSlateBlueFive.color
    }
    
    override public var isNavigationBarHidden: Bool {
        return true
    }
    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func arrangeSubviews() {
        view.addSubview(headerLabel)
        view.addSubview(infoButton)
        view.addSubview(detailedView)
        detailedView.addSubview(addFileImageView)
        detailedView.addSubview(addButton)
        detailedView.addSubview(optionsView)
        detailedView.addSubview(collectionView)
        detailedView.addSubview(toolsView)
        toolsView.addSubview(editButton)
        toolsView.addSubview(printButton)
    }
    
    override func setupViewConstraints() {
        super.setupViewConstraints()
        
        headerLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(26)
            make.top.equalToSuperview().inset(60)
            
        }
        
        infoButton.snp.makeConstraints { make in
            make.width.equalTo(26)
            make.height.equalTo(26)
            make.trailing.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(67)//67
        }
        
        detailedView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview().inset(119)
            make.bottom.equalToSuperview()
        }
        
        addFileImageView.snp.makeConstraints { make in
            make.width.equalTo(323)
            make.height.equalTo(444)
            make.leading.equalToSuperview().inset(26)
            make.top.equalToSuperview().inset(41)
        }
        
        toolsView.snp.makeConstraints { make in
            make.height.equalTo(136)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview().inset(0)
        }
        
        editButton.snp.makeConstraints { make in
            make.width.equalTo(151)
            make.height.equalTo(62)
            make.leading.equalToSuperview().inset(29)
            make.top.equalToSuperview().inset(25)
        }
        
        printButton.snp.makeConstraints { make in
            make.width.equalTo(151)
            make.height.equalTo(62)
            make.trailing.equalToSuperview().inset(29)
            make.top.equalToSuperview().inset(25)
        }
        
        addButton.snp.makeConstraints { make in
            make.width.equalTo(72)
            make.height.equalTo(72)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(447)
        }
        
        optionsView.snp.makeConstraints { make in
            make.width.equalTo(256)
            make.height.equalTo(175)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(249)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(0)
            make.leading.equalToSuperview().inset(15.5)
            make.trailing.equalToSuperview().inset(15.5)
            make.bottom.equalToSuperview().inset(136)
        }
    }
    
    override func bind() {
        super.bind()
        
        optionsView.actionClosure = { [ weak self ] importAction in
            guard let self = self else { return }
            switch importAction {
            case .scanDocument:
                self.viewModel.presentDocumentScanner(viewController: self)
            case .printDocument:
                self.viewModel.presentDocumentPicker(viewController: self)
            case .printPhoto:
                self.viewModel.presentImagePicker(viewController: self)
            }
        }
        
        viewModel.snapshotUpdated = { [ weak self ] snapshot in
            self?.dataSource.apply(snapshot)
            self?.addFileImageView.hide()
            self?.addButton.hide()
            self?.collectionView.show()
            self?.printButton.isEnabled = true
            self?.editButton.isEnabled = true
            
        }
        
        infoButton.addTarget(self,
                             action: #selector(goToInfoViewController),
                             for: .touchUpInside)
        
        addButton.addTarget(self,
                            action: #selector(openOptionsView),
                            for: .touchUpInside)
    }
}



//MARK: - UICompositionalLayout & NSDiffableDataSource
extension FilesViewController {
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvoirment in
            return self.createFilesSection()
        }
        return layout
    }
    
    func createFilesSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.414))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitem: layoutItem, count: 1)
        layoutGroup.contentInsets = NSDirectionalEdgeInsets.init(top: 20, leading: 0.0, bottom: 0.0, trailing: 0.0)
        layoutGroup.interItemSpacing = .fixed(0)
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        return layoutSection
    }
}



//MARK: - Actions
extension FilesViewController {

    @objc private func goToInfoViewController() {
        viewModel.presentInfoViewController()
    }
    
    @objc private func openOptionsView() {
        
        if optionsView.alpha == 0 {
            optionsView.show()
        } else if optionsView.alpha == 1 {
            optionsView.hide()
        }
    }
}
