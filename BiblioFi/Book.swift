//
//  Book.swift
//  BiblioFi
//
//  Created by Nikunj Tyagi on 05/07/24.
//

import Foundation
import FirebaseFirestoreSwift

struct Book2: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var author: String
    var cover: String?
    var isbn10: String?
    var isbn13: String?
    var category: String?
    var publisher: String?
    var description: String?
    var pages: Int?
    var eBook: String?
    var rating: Int?
    var count: Int?
}

