//
//  PhotoPickerManager.swift
//  Scanner
//
//  Created by Vladislav Tuleiko on 9.06.22.
//

import Foundation
import UIKit



final class ImagePickerManager: NSObject {
    
    private let imagePicker: UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        return imagePicker
    }()
    
    var selectedImages: (([EditingItem]) -> ())?
    
    
    override init() {
        super.init()
        
        imagePicker.delegate = self
    }
    
    func presentImagePicker(viewController: UIViewController) {
        viewController.present(imagePicker, animated: true)
    }
}



//MARK: - UIImagePickerDelegate
extension ImagePickerManager: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedFile = info[.imageURL] as? URL else { return }
        print("Selected photo: \(selectedFile)")
        do{
            let data = try Data(contentsOf: selectedFile)
            guard let image = UIImage(data: data) else { return }
            selectedImages?([EditingItem(image: image)])
            
        } catch {
            print("Error image manager")
        }
        
        imagePicker.dismiss(animated: true)
    }
    
}
