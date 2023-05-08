//
//  UserRequest.swift
//  InductionApp
//
//  Created by Luke Lai on 08/05/2023.
//

import Foundation

class UserRequest {
    func loginUser(email:String, password:String, completion: @escaping (User?, Error?) -> Void) {
        guard let url = URL(string: "http://localhost:5000/users/signin") else {
            print("Invalid URL")
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let body = ["email": email, "password": password]
        let jsonData = try! JSONSerialization.data(withJSONObject: body, options: [])
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let user = try JSONDecoder().decode(User.self, from: data)
                    completion(user, nil)
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    func registerUser(email:String,name:String, password:String, completion: @escaping (String?, Error?) -> Void) {
        guard let url = URL(string: "http://localhost:5000/users/register") else {
            print("Invalid URL")
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let body = ["email": email,"name":name, "password": password]
        let jsonData = try! JSONSerialization.data(withJSONObject: body, options: [])
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
                if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    if let json = try? JSONSerialization.jsonObject(with: data, options: []),
                       let dictionary = json as? [String: Any],
                       let message = dictionary["message"] as? String {
                        completion(message, nil)
                    } else {
                        completion(nil, NSError(domain: "Error decoding response JSON", code: 0, userInfo: nil))
                    }
                } else {
                    completion(nil, error)
                }
            }
            task.resume()
    }
    
}

