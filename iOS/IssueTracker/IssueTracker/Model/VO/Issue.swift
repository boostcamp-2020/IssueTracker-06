//
//  Issue.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/04.
//

import Foundation

struct Issues: HTTPDataProviding, Codable {
    
    typealias DataType = [Issue]
    static let key: String = "issues"
    
    let issues: [Issue]
}

struct Issue: Codable, HTTPDataProviding {
    
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
