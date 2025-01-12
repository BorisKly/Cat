//
//  UserData.swift
//  Cat
//
//  Created by Borys Klykavka on 11.01.2025.
//

import Foundation

struct UserData: Codable {
    var name: String
    var email: String
    var phone: String
    var position_id: Int
    var photo: Data?
}
