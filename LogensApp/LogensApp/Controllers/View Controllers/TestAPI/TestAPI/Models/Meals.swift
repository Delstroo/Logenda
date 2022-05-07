//
//  Meals.swift
//  TestAPI
//
//  Created by Delstun McCray on 4/20/22.
//

import Foundation

struct MealResponse: Decodable {
    let meals: [MealResult]
    
}

struct MealResult: Decodable {
    let name: String
    let thumbnail: String
    let id: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case thumbnail = "strMealThumb"
        case id = "idMeal"
    }//End of enum
}
