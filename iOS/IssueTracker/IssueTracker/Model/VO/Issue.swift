//
//  Issue.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/10/27.
//

import Foundation

struct Issue {

    let id: Int
    let title: String
    let milestone: Milestone?
    let labels: [Label]
    let content: String
    var isOpen: Bool
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        milestone = try? container.decode(Milestone.self, forKey: .milestone)
        labels = try container.decode([Label].self, forKey: .labels)
        content = try container.decode(String.self, forKey: .content)
        isOpen = try container.decode(Int.self, forKey: .isOpen) == 1 ? true : false
    }
    
    mutating func updateStatus(isOpen: Bool) {
        self.isOpen = isOpen
    }
}

extension Issue: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case milestone = "Milestone"
        case labels = "Labels"
        case content
        case isOpen = "is_open"
    }
}

extension Issue: Equatable {
    
    static func == (lhs: Issue, rhs: Issue) -> Bool {
        lhs.id == rhs.id
    }
    
    struct NewIssue: Codable {
        
        static var key: String = "issueId"
        
        let title: String
        let content: String
        let milestoneId: Int?
        let labelIds: [Int]?
        let assigneeIds: [Int]?
    }
}
