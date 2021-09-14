//
//  CameraView.swift
//  Memory Journey
//
//  Created by Alexander Völz on 10.09.21.
//

import SwiftUI

struct CaptureImageView {
    @Binding var isShown: Bool
    @Binding var image: Image?
    var source: UIImagePickerController.SourceType
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image, source: source)
    }
}

extension CaptureImageView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera // savedPhotosAlbum .photoLibrary .camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<CaptureImageView>) {
    }
    
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CaptureImageView(isShown: .constant(true), image: .constant(Image.sample), source: .photoLibrary)
    }
}
