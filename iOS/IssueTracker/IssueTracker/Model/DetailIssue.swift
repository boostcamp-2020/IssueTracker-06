//
//  DetailIssue.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/10/28.
//

import Foundation

struct DetailIssue {
    let user: User
    let title: String
    let issueNumber: String
    let comments: [Comment]
    let enabled: Bool
    let milestone: Milestone
    let labels: [Label]
    let assignee: [User]
}
