

//  NavBar.swift
//  SwiftUI_API
//  Created by GranzaX on 10/10/22.


import SwiftUI


struct NavBar: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Hello, World!")
                Spacer()
            }
        }
        .padding()
        .font(.headline)
        .background(
            Color.red.ignoresSafeArea(edges: .top)
        )
    }
}

 

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}


