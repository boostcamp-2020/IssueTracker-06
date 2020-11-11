//
//  Milestone.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/10/28.
//

import Foundation

struct Milestone {
    
    private var issues: Issues?
    let date: String?
    let description: String
    let id: Int
    let isOpen: Int
    let name: String
    
    init(date: String, description: String, id: Int, isOpen: Int, name: String) {
        self.description = description
        self.id = id
        self.isOpen = isOpen
        self.name = name
        self.date = date != Constant.blank ? date : nil
    }
    
    mutating func issues(_ issues: Issues) {
        self.issues = issues
    }
}

extension Milestone: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case date
        case description
        case id
        case name
        case isOpen = "is_open"
    }
}

extension Milestone: HTTPDataProviding {
    
    typealias DataType = Milestone
    static var key: String = "milestone"
}

extension Milestone: Equatable {
    
    static func == (lhs: Milestone, rhs: Milestone) -> Bool {
        lhs.id == rhs.id
    }
}

extension Milestone {
    
    enum Key {
        static let title = "제목"
        static let completeDate = "완료 날짜"
        static let description = "설명"
        static let milestoneID: String = "milestoneID"
    }
    
    enum Constant {
        static let blank = ""
    }
}
