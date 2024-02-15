//
//  AuthService.swift
//  workout-tracker
//
//  Created by santtuniskanen on 14.2.2024.
//

import Foundation

class AuthService {
    func login(email: String, password: String, completion: @escaping(Result<Bool, Error>) -> Void) {
        
        // Creating the Login request
        let url = URL(string: "http://localhost:3000/api/auth/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Request Body
        let body: [String: Any] = [
            "email": email,
            "password": password
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        // Performing Request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Checking HTTP Status
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            completion(.success(true))
        }.resume()
    }
    
    func register(firstName: String, lastName: String, email: String, password: String, completion: @escaping(Result<Bool, Error>) -> Void) {
        
        // Creating the Register request
        let url = URL(string: "http://localhost:3000/api/auth/register")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Requesr Body
        let body: [String: Any] = [
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "password": password
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        // Performing Request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Checking HTTP Status
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            completion(.success(true))
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidResponse
}
