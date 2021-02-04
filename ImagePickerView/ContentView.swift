//
//  ContentView.swift
//  ImagePickerView
//
//  Created by Shinetechnolab on 02/02/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sourceType:UIImagePickerController.SourceType =  .photoLibrary
    @State private var selectedImage:UIImage?
    @State private var isImagePickerDisplay = false
    
    var body: some View {
       
        
        NavigationView{
            
            VStack
            {
                if selectedImage != nil{
                    Image(uiImage: self.selectedImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                }else{
                    Image("download")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
                
                Spacer()
                
                HStack
                {
                    Button(action: {
                        self.sourceType = .camera
                        self.isImagePickerDisplay.toggle()
                    }, label: {
                        Text("Camera")
                        
                    })
                    
                    Button(action: {
                        self.sourceType = .photoLibrary
                        self.isImagePickerDisplay.toggle()
                    }, label: {
                        Text("PhotoLibrary")
                        
                    })
                }.padding()
                
                
                
            
            }
            .navigationBarTitle("Demo",displayMode: .inline)
            .sheet(isPresented: $isImagePickerDisplay){
                
                ImagePickerVeiw(selectedImage: $selectedImage, sourceType: self.sourceType)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
