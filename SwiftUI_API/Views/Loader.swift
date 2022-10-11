//
//  Loader.swift
//  SwiftUI_API
//
//  Created by GranzaX on 11/10/22.
//

import SwiftUI

struct Loader: View {
    @State var isLoader = false
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            //            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            if (isLoader) {
                VStack {
                    ActivityIndicator()
                        .frame(width: 160, height: 160)
                        .foregroundColor(.black)
                    
                    Spacer().frame(width: 100, height: 100)
                    
                    //                    Rectangle()
                    //                                    .frame(width: 100, height: 100, alignment: .center)
                    //                                    .cornerRadius(radius: 20.0, corners: [.topLeft])
                    
                    
                    ProgressView("Loading...")
                        .font(.verySmallFont)
                        .padding()
                        .foregroundColor(.black)

                        .cornerRadius(4)
//                        .clipShape(Rectangle().cornerRadius(10))
                        .lineLimit(100)
                        
                        .progressViewStyle(
                            CircularProgressViewStyle(
                                tint: .black
                            )
                        )
                        .scaleEffect(3)
                    
                }
            }
        }
        .onAppear {
            apiCalling()
        }
    }
    
    func apiCalling() {
        isLoader = true
        DispatchQueue.main.asyncAfter(deadline: .now()+5) {
//            isLoader = false
        }
    }
    
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}



struct ActivityIndicator: View {
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        GeometryReader { (geometry: GeometryProxy) in
            ForEach(0..<5) { index in
                Group {
                    Circle()
                        .frame(width: geometry.size.width / 5, height: geometry.size.height / 5)
                        .scaleEffect(calcScale(index: index))
                        .offset(y: calcYOffset(geometry))
                }.frame(width: geometry.size.width, height: geometry.size.height)
                    .rotationEffect(!self.isAnimating ? .degrees(0) : .degrees(360))
                    .animation(Animation
                                .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 0.9)
                                .repeatForever(autoreverses: false))
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            self.isAnimating = true
        }
    }
    
    func calcScale(index: Int) -> CGFloat {
        return (!isAnimating ? 1 - CGFloat(Float(index)) / 5 : 0.2 + CGFloat(index) / 5)
    }
    
    func calcYOffset(_ geometry: GeometryProxy) -> CGFloat {
        return geometry.size.width / 10 - geometry.size.height / 2
    }
    
}
