//
//  Books.swift
//  SwiftUI_API
//
//  Created by GranzaX on 09/10/22.
//

import Foundation


struct Book: Codable, Identifiable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}



class Api{
    func loadData(completion:@escaping ([Book]) -> ()) {
        guard
            let url = URL(string:"https://jsonplaceholder.typicode.com/posts")
        else {
            print("Invalid url...")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            let books = try! JSONDecoder().decode([Book].self, from: data!)
            print(books)
            DispatchQueue.main.async {
                completion(books)
            }
        }.resume()
        
    }
}
