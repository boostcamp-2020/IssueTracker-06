//
//  Milestone.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/10/28.
//

import Foundation

struct Milestone: Codable {
    let date: Date?
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
