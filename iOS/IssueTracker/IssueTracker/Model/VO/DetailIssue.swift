//
//  DetailIssue.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/04.
//

import Foundation

struct DetailIssue {
    
    let id: Int
    let title: String
    let milestone: Milestone?
    let labels: [Label]
    let comments: [Comment]
    let user: User
    let content: String
    let isOpen: Int
    let assignee: [User]
}

extension DetailIssue: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case milestone = "Milestone"
        case labels = "Labels"
        case comments = "Comments"
        case user = "User"
        case content
        case isOpen = "is_open"
        case assignee = "Assignee"
    }
}

extension DetailIssue: HTTPDataProviding {
    
    typealias DataType = DetailIssue
    static var key = "issue"
}
