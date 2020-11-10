//
//  Labels.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/10.
//

import Foundation

struct Labels {

    private let labels: [Label]
    
    var count: Int {
        labels.count
    }
    
    init() {
        labels = []
    }
    
    init(labels: [Label]) {
        self.labels = labels
    }
    
    subscript (_ index: Int) -> Label? {
        labels[safe: index]
    }
}

extension Labels: Codable {}

extension Labels: HTTPDataProviding {
    
    typealias DataType = [Label]
    static var key = "labels"
}
