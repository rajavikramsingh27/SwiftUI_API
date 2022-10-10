//
//  Components.swift
//  SwiftUI_API
//
//  Created by GranzaX on 09/10/22.
//

import SwiftUI

struct CustomLabelTextField: View {
    var label: String
    var placeHolder: String
    var secure: Bool
    var keyboardTypeCustom: UIKeyboardType = .default
    @Binding var bVariable: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            
            if (secure) {
                SecureField(placeHolder, text: $bVariable)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(5)
            } else {
                TextField(placeHolder, text: $bVariable)
                    .keyboardType(keyboardTypeCustom)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(5)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Button(action: {
                                hideKeyboard()
                            }) {
                                Text("Done")
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.trailing)
                            }
                            .frame(width: 380, alignment: .trailing)
                        }
                    }
            }
        }
    }
}

//struct Components_Previews: PreviewProvider {
//    @State private var name = ""
//
//
//    static var previews: some View {
//        CustomLabelTextField(label: "Title", placeHolder: "Place holder", secure: true, bVariable: name)
//    }
//}
