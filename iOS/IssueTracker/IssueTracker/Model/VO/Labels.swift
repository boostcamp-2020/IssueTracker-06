//
//  Labels.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/10.
//

import Foundation

struct Labels {

    private var labels: [Label]
    
    var count: Int {
        labels.count
    }
    
    var id: [Int] {
        labels.map { $0.id }
    }
    
    init() {
        labels = []
    }
    
    init(labels: [Label]) {
        self.labels = labels
    }
    
    func contains(label: Label) -> Bool {
        labels.contains(label)
    }
    
    mutating func add(label: Label) {
        labels.append(label)
    }
    
    mutating func remove(label: Label) {
        labels.removeAll {
            $0 == label
        }
    }
    
    mutating func replace(label: Label) {
        guard let index = labels.firstIndex(of: label) else { return }
        labels[index] = label
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
