//
//  CreateFolder.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/16/24.
//

import Foundation

struct CreateFolder {
    
    var parameters: CreateFolderDto
    
    func call(completion: @escaping (SessionAuthentication) -> Void, failure: @escaping (ErrorResponse) -> Void) {
            
        let scheme: String = "https"
        let host: String = "bananabakeryrest.com"
        let path = "/recipes/folder"
            
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
            
        guard let url = components.url else {
            failure(ErrorResponse(details: "Server request error! URL"))
            return
        }
            
        var request = URLRequest(url: url)
        request.httpMethod = "post"
            
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
            
        do {
            request.httpBody = try JSONEncoder().encode(parameters)
        } catch {
            failure(ErrorResponse(details: "Server request error! FTE"))
        }
            
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                    let response = try? JSONDecoder().decode(SessionAuthentication.self, from: data)
                    
                    if let response = response {
                        completion(response)
                    } else {
                        let error = try? JSONDecoder().decode(ErrorResponse.self, from: data)
                        if let error = error {
                            failure(ErrorResponse(details: error.details))
                        } else {
                            failure(ErrorResponse(details: "Server error. Please try again."))
                        }
                    }
                } else {
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                    }
                }
            }
            task.resume()
    }
}
