

//  ViewTwo.swift
//  SwiftUI_API
//  Created by GranzaX on 10/10/22.


import SwiftUI


struct ViewTwo: View {
    
//    init() {
//        //Use this if NavigationBarTitle is with Large Font
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]
//
//        //Use this if NavigationBarTitle is with displayMode = .inline
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
//    }
    
    var body: some View {
        
        VStack {
            NavBar()
            Spacer()
        }
        
//        NavigationView {
//            Text("Don't use .appearance()!")
//            .navigationBarTitle("displayMode", displayMode: .large)
//            .navigationBarHidden(true)
//        }
    }
    
}



struct ViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        ViewTwo()
    }
}


