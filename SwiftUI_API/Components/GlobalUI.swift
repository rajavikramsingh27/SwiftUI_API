//
//  GlobalUI.swift
//  SwiftUI_API
//
//  Created by GranzaX on 09/10/22.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


