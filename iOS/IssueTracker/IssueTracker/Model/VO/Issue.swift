//
//  Issue.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/10/27.
//

import Foundation

struct Issues: HTTPDataProviding, Codable {
    
    subscript (_ index: Int) -> Issue? {
        return issues[safe: index]
    }
    
    typealias DataType = [Issue]
    static let key: String = "issues"
    
    let issues: [Issue]
    var count: Int {
        issues.count
    }
}

struct Issue: Codable {
    
    let id: Int
    let title: String
    let milestone: Milestone?
    let labels: [Label]
    let content: String
    let isOpen: Int
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case milestone = "Milestone"
        case labels = "Labels"
        case content
        case isOpen = "is_open"
    }
}
