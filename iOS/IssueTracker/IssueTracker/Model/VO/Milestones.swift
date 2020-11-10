//
//  Milestones.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/10.
//

import Foundation

struct Milestones {

    private(set) var milestones: [Milestone]
    
    var count: Int {
        milestones.count
    }
    
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
    
    subscript (_ index: Int) -> Milestone? {
        milestones[safe: index]
    }
}

extension Milestones: Codable {}

extension Milestones: HTTPDataProviding {
    
    typealias DataType = [Milestone]
    static let key: String = "milestones"
}
