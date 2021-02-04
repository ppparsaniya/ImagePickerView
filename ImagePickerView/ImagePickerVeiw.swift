//
//  ImagePickerVeiw.swift
//  ImagePickerView
//
//  Created by Shinetechnolab on 02/02/21.
//
import UIKit
import SwiftUI

struct ImagePickerVeiw: UIViewControllerRepresentable {
   
    @Binding var selectedImage:UIImage?
    @Environment(\.presentationMode) var isPresented
    var sourceType:UIImagePickerController.SourceType
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    
    func makeUIViewController(context: Context) -> some UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = self.sourceType
        imagePicker.delegate = context.coordinator // confirm Protocol
        return imagePicker
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}

class  Coordinator: NSObject,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    var picker:ImagePickerVeiw
    
    init(picker:ImagePickerVeiw) {
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.selectedImage = selectedImage
        self.picker.isPresented.wrappedValue.dismiss()
    }
    
}

