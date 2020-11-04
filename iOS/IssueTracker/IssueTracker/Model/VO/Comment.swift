//
//  Comment.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/04.
//

import Foundation

struct Comment: Codable {
    
    let user: User
    let createdAt: String?
    let updatedAt: String?
    let content: String
    let id: Int
    
    private enum CodingKeys: String, CodingKey {
        case user = "User"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case content
        case id
    }
}
