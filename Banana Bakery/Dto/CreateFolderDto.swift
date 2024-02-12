//
//  CreateFolderDto.swift
//  Banana Bakery
//
//  Created by Benjamin Michael on 2/11/24.
//

import Foundation

struct CreateFolderDto: Hashable, Codable {
    var folderName: String
    var authentication: SessionAuthentication
}
