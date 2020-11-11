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
        issues.filter { $0.isOpen }.count
    }
    
    var closedCount: Int {
        issues.filter { !$0.isOpen }.count
    }
    
    var id: [Int] {
        issues.map { $0.id }
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
    
    mutating func remove(id: Int) {
        issues.removeAll {
            $0.id == id
        }
    }
    
    mutating func close(id: [Int]) {
        issues = issues.map {
            guard id.contains($0.id) else { return $0 }
            var issue = $0
            issue.updateStatus(isOpen: false)
            return issue
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
