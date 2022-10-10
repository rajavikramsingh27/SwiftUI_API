//
//  ButtonCustom.swift
//  SwiftUI_API
//
//  Created by GranzaX on 09/10/22.
//

import SwiftUI

struct ButtonCustom: View {
    var text: String
    var clicked: (() -> Void) /// use closure for callback
    
    var body: some View {
        Button(action: clicked) { /// call the closure here
            HStack {
                Text(text) /// your text
            }
            .foregroundColor(Color.green)
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(16)
        }
    }
}
