//
//  GetRecipes.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/12/24.
//

import Foundation

struct GetRecipes {
    
    var params: SessionAuthentication
    
    func call(success: @escaping (FolderGroup) -> Void, failure: @escaping (ErrorResponse) -> Void) {
        
        let scheme: String = "https"
        let host: String = "banana-bakery-api.sru2o7tj9va4a.us-west-2.cs.amazonlightsail.com"
        let path = "/api/recipes"
            
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = [
            URLQueryItem(name: "username", value: params.username),
            URLQueryItem(name: "key", value: params.sessionKey)
        ]
            
        guard let url = components.url else {
            failure(ErrorResponse(details: "Server request error! URL"))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "get"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                let response = try? JSONDecoder().decode(FolderGroup.self, from: data)
                
                if let response = response {
                    success(response)
                } else {
                    let error = try? JSONDecoder().decode(ErrorResponse.self, from: data)
                    if error != nil {
                        failure(error!)
                    }
                }
            } else {
                if let error = error {
                    print("Fatal error: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}
