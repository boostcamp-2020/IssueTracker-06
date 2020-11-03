//
//  Comment.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/10/28.
//

import Foundation

struct Comment: Codable {
    let user: User
    let createAt: String?
    let updateAt: String?
    let content: String
    let id: Int
    
    private enum CodingKeys: String, CodingKey {
        case user = "User"
        case createAt = "created_at"
        case updateAt = "updated_at"
        case content
        case id
    }
}
