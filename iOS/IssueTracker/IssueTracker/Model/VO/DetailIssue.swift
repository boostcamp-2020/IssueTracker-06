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
    var isOpen: Bool
    let assignee: [User]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        milestone = try? container.decode(Milestone.self, forKey: .milestone)
        labels = try container.decode([Label].self, forKey: .labels)
        comments = try container.decode([Comment].self, forKey: .comments)
        user = try container.decode(User.self, forKey: .user)
        content = try container.decode(String.self, forKey: .content)
        isOpen = try container.decode(Int.self, forKey: .isOpen) == 1 ? true : false
        assignee = try container.decode([User].self, forKey: .assignee)
    }
    
    mutating func updateState(isOpen: Bool) {
        self.isOpen = isOpen
    }
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
    
    struct patchTitleDetailIssue: Codable {
        let title: String
    }
    
    struct patchContentDetailIssue: Codable {
        let content: String
    }
    
    struct IssueStatus: Codable {
        let isOpen: Bool
    }
}

extension DetailIssue: HTTPDataProviding {
    
    typealias DataType = DetailIssue
    static var key = "issue"
}
