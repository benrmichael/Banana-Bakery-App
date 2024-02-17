//
//  NetworkService.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/11/24.
//

import Foundation

extension String: Error {}

enum RequestType: String, CaseIterable {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum Endpoint: String, CaseIterable {
    case login = "/users/login"
    case createUser, deleteUser, getUser, updateUser = "/users"
    case resetPassword = "/users/reset"
    case createFolder, deleteFolder, updateFolder = "/recipes/folder"
    case recipeSearch = "/search"
    case getRecipes, deleteRecipe, saveRecipe = "/recipes"
    case generateAuthentication = "/auth/generate"
    case validateAuthentication = "/auth"
}

enum ServerRequestError: Error {
    case urlComponentsError(message: String)
    case encodingError(message: String)
    case decodingError(message: String)
}


struct NetworkService<RequestBody:Codable, ResponseBody:Codable> {
    
    var baseUrl: String = "bananabakeryrest.com"
    var endpoint: Endpoint
    var httpRequestType: RequestType
    var headerParams: [String:String]?
    var requestBody: RequestBody?
    
    func call(success: @escaping (ResponseBody) -> Void, failure: @escaping (ErrorResponse) -> Void) {
        let request: URLRequest
        
        do {
            request = try createUrlRequest()
        } catch {
            failure(ErrorResponse(details: error.localizedDescription))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                let response = try? JSONDecoder().decode(ResponseBody.self, from: data)
                
                if let response = response {
                    success(response)
                } else {
                    let error = try? JSONDecoder().decode(ErrorResponse.self, from: data)
                    if let error = error {
                        failure(error)
                    }
                }
            } else {
                if let error = error {
                    failure(ErrorResponse(details: "Fatal error: \(error.localizedDescription)"))
                }
            }
        }
        task.resume()
    }
    
    private func createUrlComponents() -> URLComponents {
        let scheme: String = "https"
        let path: String = endpoint.rawValue
        
        var components = URLComponents()
        components.scheme = scheme
        components.host = baseUrl
        components.path = path
        if let headerParams = headerParams {
            components.queryItems = headerParams.map { (key, value) in
                URLQueryItem(name: key, value: value)
            }
        }
        
        return components
    }
    
    private func createUrlRequest() throws -> URLRequest {
        let components = createUrlComponents()
        guard let url = components.url else {
            throw ServerRequestError.urlComponentsError(message: "Unable to create url components!")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpRequestType.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if let requestBody = requestBody {
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            do {
                request.httpBody = try JSONEncoder().encode(requestBody)
            } catch {
                throw ServerRequestError.encodingError(message: "Unable to encode JSON body!")
            }
        }
        
        return request
    }
}
