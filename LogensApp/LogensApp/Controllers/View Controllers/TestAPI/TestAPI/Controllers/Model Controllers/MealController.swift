//
//  MealController.swift
//  TestAPI
//
//  Created by Delstun McCray on 4/20/22.
//

import Foundation
import UIKit

class MealController {
    static let cache = NSCache<NSString, UIImage>()
    
    static var baseURL = "https://www.themealdb.com/api/json/v1/1/filter.php"
    
    static func fetchMeals(id: String, completion: @escaping (Result<[MealResult], MealError>) -> Void) {
        
        guard let baseURL = URL(string: baseURL) else { return completion(.failure(.invalidURL)) }
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let mealIDCategory = URLQueryItem(name: "c", value: id)
        components?.queryItems = [mealIDCategory]
        
        guard let finalURL = components?.url else { return completion(.failure(.invalidURL)) }
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            if let error = error {
                return completion(.failure(.throwError(error)))
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    print("STATUS CODE: \(response.statusCode)")
                }
            }
            
            guard let data = data else { return completion(.failure(.noData)) }
            
            do {
                let topLevelObject = try JSONDecoder().decode(MealResponse.self, from: data)
                
                var arrayOfMeals: [MealResult] = []
                for strMeal in topLevelObject.meals {
                    arrayOfMeals.append(strMeal)
                }
                completion(.success(arrayOfMeals))
            } catch {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                return completion(.failure(.throwError(error)))
            }
        }.resume()
    }
    
    static func fetchMealImages(strMeal: String, completion: @escaping (Result<UIImage, MealError>) -> Void) {
        guard let baseURL = URL(string: "\(strMeal)") else { return completion(.failure(.invalidURL)) }
        print(baseURL)
        
        URLSession.shared.dataTask(with: baseURL) { data, _, error in
            if let error = error {
                return completion(.failure(.throwError(error)))
            }
            guard let data = data else { return completion(.failure(.noData)) }
            
            guard let imageView = UIImage(data: data) else { return completion(.failure(.unableToDecode)) }
            self.cache.setObject(imageView, forKey: NSString(string: strMeal))
            completion(.success(imageView))
        }.resume()
    }
}
