//
//  ViewOne.swift
//  SwiftUI_API
//
//  Created by GranzaX on 09/10/22.
//

import SwiftUI

struct ViewOne: View {
    @State var books = [Book]()
    
    var body: some View {
        List(books) { book in
            
            VStack(alignment: .leading) {
                Text("\(book.title)")
                    .font(.title)
                    .foregroundColor(.red)
                    .padding(.bottom)
                HStack{
                    Text("\(book.id)")
                        .font(.body)
                        .fontWeight(.bold)
                    
                    Text("\(book.body)")
                        .font(.body)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            
        }
        .onAppear() {
            Api().loadData { (books) in
                self.books = books
            }
        }
    }
}

struct ViewOne_Previews: PreviewProvider {
    static var previews: some View {
        ViewOne()
    }
}
