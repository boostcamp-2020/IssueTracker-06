//
//  Issues.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/10.
//

import Foundation

struct Issues {
    
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

extension Issues: Codable {}

extension Issues: HTTPDataProviding {
    
    typealias DataType = [Issue]
    static let key: String = "issues"
}
