//
//  CURL Request.swift
//  CaloriesApp
//
//  Created by Данила on 06.09.2023.
//

import Foundation
import Firebase
import FirebaseFirestore
import SwiftUI

class CurlRequest: ObservableObject {
    @AppStorage("curl") var curl: String = "" {
        willSet { objectWillChange.send() }
    }
    private func request(oAuthToken: String) {
        print("O", oAuthToken)
        let url = URL(string: "https://iam.api.cloud.yandex.net/iam/v1/tokens")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // Создаем тело запроса с данными, аналогичными вашему curl-запросу
        let requestBody: [String: Any] = ["yandexPassportOauthToken": oAuthToken]
        let jsonData = try? JSONSerialization.data(withJSONObject: requestBody)
        request.httpBody = jsonData

        // Создаем сессию URLSession и выполняем запрос
        let session = URLSession.shared

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Ошибка при выполнении запроса: \(error)")
                return
            }
            
            guard let data = data else {
                print("Пустой ответ от сервера")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let iamToken = json["iamToken"] as? String {
                    self.curl = iamToken
                    print("iAM получен")
                } else {
                    print("Не удалось извлечь IAM токен из ответа")
                }
            } catch {
                print("Ошибка при разборе JSON: \(error)")
            }
        }
        task.resume()
    }
    
    func getOauthToken() {
        let db = Firestore.firestore()
        let docRef = db.collection("OauthToken").document("BHuJ24WGeLfuSMbGMPZZ")
        docRef.getDocument { (document, error) in
            if error != nil {
                print("Error")
            } else if let document = document, document.exists {
                if let token = document.data()?["token"] as? String {
                    self.request(oAuthToken: token)
                } else {
                    print("Error 2")
                }
            } else {
                print("Document does not exist")
            }
        }
    }
    
    
    func translateText(texts: [String], completion: @escaping (Result<[String], Error>) -> Void) {
        let url = URL(string: "https://translate.api.cloud.yandex.net/translate/v2/translate")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(self.curl)", forHTTPHeaderField: "Authorization")
        
        let requestBody: [String: Any] = [
            "targetLanguageCode": "en",
            "texts": texts,
            "folderId": "b1gk6qegkvlq1hei03rm"
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestBody)
            request.httpBody = jsonData
        } catch {
            completion(.failure(error))
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Response Data Error", code: 0, userInfo: nil)))
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let translationsArray = json["translations"] as? [[String: Any]] {
                    let translations = translationsArray.compactMap { translation in
                        return translation["text"] as? String
                    }
                    completion(.success(translations))
                } else {
                    completion(.failure(NSError(domain: "JSON Parsing Error", code: 0, userInfo: nil)))
                }
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    
}
