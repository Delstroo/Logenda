//
//  Category.swift
//  TestAPI
//
//  Created by Delstun McCray on 4/20/22.
//

import Foundation

struct CategoryResponse: Decodable {
    let categories: [Category]
}// End of struct

struct Category: Decodable {
    let id: String
    let name: String
    let thumbnail: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case thumbnail = "strCategoryThumb"
        case description = "strCategoryDescription"
        
    }//End of enum
    
}
