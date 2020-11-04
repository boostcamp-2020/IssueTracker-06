//
//  Milestone.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/04.
//

import Foundation

struct Milestones: Codable, HTTPDataProviding {
    
    typealias DataType = [Milestone]
    static let key: String = "milestones"
    
    let milestones: [Milestone]
}

struct Milestone: Codable, HTTPDataProviding {
    
    typealias DataType = Milestone
    static var key: String = "milestone"
    
    let date: String?
    let description: String
    let id: Int
    let isOpen: Int
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case date
        case description
        case id
        case name
        case isOpen = "is_open"
    }
}
