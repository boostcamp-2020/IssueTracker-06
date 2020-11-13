//
//  User.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/10/28.
//

import Foundation

struct User: Codable {
    
    let profile: String
    let name: String
    let email: String
    let id: Int
}

extension User: Equatable {
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
}
