//
//  UserInformation.swift
//  Banana Bakery
//
//  Created by Michael, Ben on 2/14/24.
//

import Foundation

struct Profile {
    var authentication: SessionAuthentication
    
    func call(success: @escaping (FolderGroup) -> Void, failure: @escaping (ErrorResponse) -> Void) {
        
        let scheme: String = "https"
        let host: String = "bananabakeryrest.com"
        let path = "/users"
            
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = [
            URLQueryItem(name: "username", value: authentication.username),
            URLQueryItem(name: "key", value: authentication.sessionKey)
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
