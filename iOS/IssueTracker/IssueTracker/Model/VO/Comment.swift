//
//  Comment.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/10/28.
//

import Foundation

struct Comment {

    let user: User
    let createdAt: String?
    let updatedAt: String?
    let content: String
    let id: Int
}

extension Comment: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case user = "User"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case content
        case id
    }
    
    struct NewComment: Codable {
        
        static var key: String = "commentId"
        
        let content: String
        let issueId: Int
    }
}

extension Comment: HTTPDataProviding {
    
    typealias DataType = Comment
    static var key = "comment"
}
