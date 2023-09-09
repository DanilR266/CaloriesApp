//
//  RequestFood.swift
//  CaloriesApp
//
//  Created by Данила on 06.09.2023.
//

import Foundation

class RequestFood {
    func fetchFoodData(ingredient: String, completion: @escaping (Nutrients?) -> Void) {
        let baseURL = "https://api.edamam.com/api/food-database/v2/parser"
        let queryItems = [
            URLQueryItem(name: "app_id", value: "d1dcbf2a"),
            URLQueryItem(name: "app_key", value: "8c956341b60cf4a9f473781300165f0e"),
            URLQueryItem(name: "ingr", value: ingredient)
        ]
        
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url else {
            print("error1")
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error2")
                return
            }
            
            guard let data = data else {
                print("error 3")
                return
            }
            do {
                let goodsResponse = try JSONDecoder().decode(Welcome.self, from: data)
                if goodsResponse.parsed?.count ?? 0 > 0 {
                    completion(goodsResponse.parsed?[0].food?.nutrients)
                }
            } catch {
                print("error4")
            }
        }
        
        task.resume()
    }
}
