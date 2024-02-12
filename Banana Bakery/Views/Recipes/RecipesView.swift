//
//  RecipesView.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/11/24.
//

import SwiftUI

struct RecipesView: View {
    var credentials: Credentials
    @State private var folders: [FolderDto] = []
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(folders) { folder in
                    Text("Folder: \(folder.name)")
                }
            }
            .task {
                await getFolders()
            }
        } detail: {
            Text("Select a folder")
        }
    }
    
    func getFolders() async {
        guard let encoded =  try? JSONEncoder().encode(SessionAuthentication(username: credentials.username, sessionKey: credentials.key)) else {
            print("Failed to encode the data!")
            return
        }
        
        let scheme: String = "https"
        let host: String = "banana-bakery-api.sru2o7tj9va4a.us-west-2.cs.amazonlightsail.com"
        let path = "/recipes"
            
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
            
        guard let url = components.url else {
            print("Failed to create URL!")
            return
        }
            
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedData = try JSONDecoder().decode(FolderGroup.self, from: data)
            self.folders = decodedData.folders
        } catch {
            print("Failed to fetch the folders! \(error.localizedDescription)")
        }
    }
}

#Preview {
    RecipesView(credentials: Credentials(username: "Admin", key: "Idk"))
}
