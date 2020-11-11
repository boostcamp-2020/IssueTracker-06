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
    var isOpen: Int
    
    mutating func updateStatus(isOpen: Bool) {
        let isOpen = isOpen ? 1 : 0
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
}
