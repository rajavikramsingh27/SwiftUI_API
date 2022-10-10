//
//  NavBarLarge.swift
//  SwiftUI_API
//
//  Created by GranzaX on 10/10/22.
//

import SwiftUI

struct NavBarLarge: View {
    
    @StateObject var statusBarConfigurator = StatusBarConfigurator()
    
    init() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = .black
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
    
    var body: some View {
        NavigationView {
            List {
                Text("Hello, SwiftUI!")
                Button("Black") {
                                statusBarConfigurator.statusBarStyle = .darkContent
                            }
                            Button("White") {
                                statusBarConfigurator.statusBarStyle = .lightContent
                            }
                
            }
            .navigationTitle("Navigation Title")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Text("One")
                    Text("Two")
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Text("One")
                    Text("Two")
                }
            }
        }
        
        .prepareStatusBarConfigurator(statusBarConfigurator)
        .onAppear {
            statusBarConfigurator.statusBarStyle = .lightContent
        }
        
    }
}

struct NavBarLarge_Previews: PreviewProvider {
    static var previews: some View {
        NavBarLarge()
    }
}
