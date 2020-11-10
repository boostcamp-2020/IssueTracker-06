//
//  Milestones.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/10.
//

import Foundation

struct Milestones {

    private(set) var milestones: [Milestone]
    
    init(milestones: [Milestone]) {
        self.milestones = milestones
    }
    
    mutating func add(milestone: Milestone) {
        milestones.append(milestone)
    }
    
    mutating func remove(milestone: Milestone) {
        milestones.removeAll {
            $0 == milestone
        }
    }
}

extension Milestones: Codable {}

extension Milestones: HTTPDataProviding {
    
    typealias DataType = [Milestone]
    static let key: String = "milestones"
}
