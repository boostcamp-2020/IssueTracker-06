//
//  User.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/04.
//

import Foundation

struct User: Codable {
    
    let profile: String
    let name: String
    let email: String
    let id: Int
}
