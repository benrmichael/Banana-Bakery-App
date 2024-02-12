//
//  Login.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/11/24.
//

import Foundation

struct Login {
    
    var parameters: LoginRequest
        
    func call(completion: @escaping (LoginResponse) -> Void, failure: @escaping (ErrorResponse) -> Void) {
            
        let scheme: String = "https"
        let host: String = "banana-bakery-api.sru2o7tj9va4a.us-west-2.cs.amazonlightsail.com"
        let path = "/users/login"
            
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
            
        guard let url = components.url else {
            // return from call if failure to create url
            return
        }
            
        var request = URLRequest(url: url)
        request.httpMethod = "post"
            
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
            
        do {
            request.httpBody = try JSONEncoder().encode(parameters)
        } catch {
            // Error: Unable to encode request parameters
            print("Failure to encode the request parameters")
        }
            
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                    let response = try? JSONDecoder().decode(LoginResponse.self, from: data)
                    
                    if let response = response {
                        completion(response)
                    } else {
                        // Error: Unable to decode response JSON
                        let error = try?
                            JSONDecoder().decode(ErrorResponse.self, from: data)
                        if let error = error {
                            failure(error)
                        }
                    }
                } else {
                    // Error: API request failed
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                    }
                }
            }
            task.resume()
    }
}
