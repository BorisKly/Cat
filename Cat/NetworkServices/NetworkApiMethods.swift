//
//  NetworkApiMethods.swift
//  Cat
//
//  Created by Borys Klykavka on 12.01.2025.
//

import Foundation

enum NetworkApiMethods: String {
    
    case users = "users"
    case positions = "positions"
    case token = "token"
    
    var path: String {
        let generalPath = #"/api/v1/"#
        return generalPath+self.rawValue
    }
    
}
