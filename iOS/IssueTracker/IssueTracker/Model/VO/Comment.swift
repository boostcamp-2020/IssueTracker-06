//
//  Comment.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/04.
//

import Foundation

struct Comment: Codable {
    let user: User?
    let createAt: String?
    let updateAt: String?
    let content: String?
    let id: Int?
    
    private enum CodingKeys: String, CodingKey {
        case user = "User"
        case createAt = "createdAt"
        case updateAt = "updatedAt"
        case content
        case id
    }
}
