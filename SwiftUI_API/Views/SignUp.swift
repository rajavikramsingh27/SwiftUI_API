

//  SignUp.swift
//  SwiftUI_API
//  Created by GranzaX on 09/10/22.


import SwiftUI


struct SignUp: View {
    @State private var userName = ""
    @State private var password = ""
    @State private var number = ""
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var shouldShowImagePicker = false
    @State var imageSelected:UIImage?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    Button {
                        print("camera")
                        shouldShowImagePicker.toggle()
                    } label: {
                        if let image = self.imageSelected {
                            Image(uiImage: image)
                                .resizable()
                        } else {
                            Image(uiImage: UIImage (named: "IMG-20220407-WA0001")!)
                                .resizable()
                        }
                    }
                    .frame(width: 100, height: 100)
                    .background(.yellow)
                    .clipShape(Circle())
                    .clipped()

                    CustomLabelTextField(label: "Password", placeHolder: "Enter your user name", secure: true, bVariable: $password)
                    CustomLabelTextField(label: "Number", placeHolder: "Enter your user name", secure: false, keyboardTypeCustom: .numberPad, bVariable: $number)
                    CustomLabelTextField(label: "User Name", placeHolder: "Enter your user name", secure: false, bVariable: $userName)

                    ButtonCustom(
                        text: "Custom Button"
                    ) {
                        print("Clicked!")
                    }
                }

                .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                .background(Color.red)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    self.hideKeyboard()
                }
            }
            .background(Color.red)
            .sheet(isPresented: $shouldShowImagePicker) {
                ImagePickerView(image: $imageSelected, sourceType: self.sourceType)
            }
            
            .navigationTitle("All Inboxes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    
                    Button {
                        print("Button One")
                    } label: {
                        Text("One")
                    }
                    
                    Button {
                        print("Button One")
                    } label: {
                        Text("Two")
                    }

                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button {
                        print("Button One")
                    } label: {
                        Text("One")
                    }
                    
                    Button {
                        print("Button One")
                    } label: {
                        Text("Two")
                    }

                }

                
            }
            //        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
            //            ImagePicker(image: $image, sourceType: self.sourceType)
            //                .ignoresSafeArea()
            //        }
        }
    }
    
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

