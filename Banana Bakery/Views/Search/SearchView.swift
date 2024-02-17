//
//  SearchView.swift
//  Banana Bakery
//
//  Created by Michael, Ben on 2/14/24.
//

import SwiftUI

struct SearchView: View {
    var auth: SessionAuthentication
    @State private var searchModel: SearchViewModel = SearchViewModel()
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            TextField("Search for recipes...", text: $searchText, onCommit: {
                searchForRecipes()
            })
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(
                        Button {
                            searchForRecipes()
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.blue)
                        }
                            .padding(.trailing, 25)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    )
            List {
                ForEach(searchModel.recipes) { recipe in
                    Text(recipe.name)
                        .font(.title)
                }
            }
        }
    }
    
    func searchForRecipes() {
        if searchText.isEmpty {
            print("Can't search if there is no string")
        } else {
            searchModel.searchForRecipes(query: searchText, auth)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(auth: SessionAuthentication(username: "Admin", sessionKey: "<KeyHere>"))
    }
}
