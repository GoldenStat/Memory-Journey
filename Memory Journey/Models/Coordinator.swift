//
//  Coordinator.swift
//  Memory Journey
//
//  Created by Alexander Völz on 10.09.21.
//

import Foundation
import UIKit
import SwiftUI

class Coordinator : NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var isCoordinatorShown: Bool
    @Binding var imageInCoordinator: Image?
    var source: UIImagePickerController.SourceType
    
    init(isShown: Binding<Bool>, image: Binding<Image?>, source: UIImagePickerController.SourceType) {
        _isCoordinatorShown = isShown
        _imageInCoordinator = image
        self.source = source
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let unwrappedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        imageInCoordinator = Image(uiImage: unwrappedImage)
        isCoordinatorShown = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isCoordinatorShown = false
    }
    
    
}
