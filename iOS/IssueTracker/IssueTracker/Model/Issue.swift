//
//  Issue.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/10/27.
//

import Foundation

struct Issue {
    let id: String
    let title: String
    let description: String
    let milestone: String
    let labels: [Label]
}
