//
//  Issue.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/10/27.
//

import Foundation

struct Issues: HTTPDataProviding, Codable {

    typealias DataType = [Issue]
    
    static let key: String = "issues"
    private var issues: [Issue]
    
    var count: Int {
        issues.count
    }
    
    var openCount: Int {
        issues.filter {
            $0.isOpen == 1
        }.count
    }
    
    var closedCount: Int {
        issues.filter {
            $0.isOpen == 0
        }.count
    }
    
    init() {
        issues = []
    }
    
    init(issues: [Issue]) {
        self.issues = issues
    }
    
    func contains(issue: Issue) -> Bool {
        issues.contains(issue)
    }
    
    mutating func add(issue: Issue) {
        issues.append(issue)
    }
    
    mutating func remove(issue: Issue) {
        issues.removeAll {
            $0 == issue
        }
    }
    
    subscript (_ index: Int) -> Issue? {
        issues[safe: index]
    }
}

struct Issue: Codable, Equatable {

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
    
    static func == (lhs: Issue, rhs: Issue) -> Bool {
        lhs.id == rhs.id
    }
}
