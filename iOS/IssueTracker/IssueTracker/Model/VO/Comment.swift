//
//  Comment.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/10/28.


import Foundation

struct Comment: Codable, HTTPDataProviding {
    
    typealias DataType = Comment
    static var key = "comment"
    
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
