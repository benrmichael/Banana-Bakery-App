////
////  NetworkService.swift
////  Banana Bakery
////
////  Created by Benjamin Michael on 2/11/24.
////
//
//import Foundation
//
//struct Error {
//    var code: Int
//    var reason: String
//}
//
//enum RequestType: String, CaseIterable {
//    case get = "GET"
//    case post = "POST"
//    case put = "PUT"
//    case delete = "DELETE"
//}
//
//enum Endpoint: String, CaseIterable {
//    case login = "/users/login"
//    case createUser, deleteUser, getUser, updateUser = "/users"
//    case resetPassword = "/users/reset"
//    case createFolder, deleteFolder, updateFolder = "/recipes/folder"
//    case recipeSearch = "/search"
//    case getRecipes, deleteRecipe, saveRecipe = "/recipes"
//    case generateAuthentication = "/auth/generate"
//    case validateAuthentication = "/auth"
//}
//
//struct NetworkService {
//    
//    private static var baseUrl: String = "banana-bakery-api.sru2o7tj9va4a.us-west-2.cs.amazonlightsail.com"
//    
//    static func call<T: Codable, S: Codable>(endpoint: Endpoint, body: T? = nil, responseType: S.Type, params: [String: String] = [:], method: RequestType) async -> (S?, Error?) {
//        // Generate the URL
//        guard let url = buildUrl(endpoint, params) else {
//            return (nil, Error(code: 500, reason: "Failed to create the URL"))
//        }
//        
//        var request = URLRequest(url: url)
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        if body != nil {
//            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            do {
//                request.httpBody = try JSONEncoder().encode(body)
//            } catch {
//                return (nil, Error(code: 500, reason: "Could not encode data"))
//            }
//            do {
//                let task = URLSession.shared.dataTask(with: request) { data, _, error in
//                    let response = try? JSONDecoder().decode(responseType, from: data!)
//                    if let response = response {
//                        return (response, nil)
//                    }
//                }
//            }
//
//        } else {
//            do {
//                let (data, _) = try await URLSession.shared.data(for: request)
//                let decodedData = try JSONDecoder().decode(responseType, from: data)
//                return (decodedData, nil)
//            } catch {
//                print("I'm here?")
//                return (nil, Error(code: 500, reason: "Could not complete request"))
//            }
//        }
//    }
//    
//    // Build out the URL
//    private static func buildUrl(_ endpoint: Endpoint, _ parameters: [String: String] = [:]) -> URL? {
//        let scheme: String = "https"
//        let host: String = baseUrl
//        let path: String = endpoint.rawValue
//        
//        var components = URLComponents()
//        components.scheme = scheme
//        components.path = path
//        components.host = host
//        if !parameters.isEmpty {
//            components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value)}
//        }
//        
//        return components.url
//    }
//    
//    
////    func call() async {
////        guard let encoded =  try? JSONEncoder().encode(SessionAuthentication(username: credentials.username, sessionKey: credentials.key)) else {
////            print("Failed to encode the data!")
////            return
////        }
////        
////        let scheme: String = "https"
////        let host: String = "banana-bakery-api.sru2o7tj9va4a.us-west-2.cs.amazonlightsail.com"
////        let path = "/recipes"
////        
////        var components = URLComponents()
////        components.scheme = scheme
////        components.host = host
////        components.path = path
////        
////        guard let url = components.url else {
////            print("Failed to create URL!")
////            return
////        }
////        
////        var request = URLRequest(url: url)
////        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
////        request.addValue("application/json", forHTTPHeaderField: "Accept")
////        request.httpMethod = "GET"
////        
////        do {
////            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
////            let decodedData = try JSONDecoder().decode(FolderGroup.self, from: data)
////            self.folders = decodedData.folders
////        } catch {
////            print("Failed to fetch the folders! \(error.localizedDescription)")
////        }
////    }
////    }
//}
