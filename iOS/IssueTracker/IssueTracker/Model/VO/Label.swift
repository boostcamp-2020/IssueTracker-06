//
//  Label.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/10/27.
//

import Foundation

struct Labels: Codable, HTTPDataProviding {

    typealias DataType = [Label]
    static var key = "labels"

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

struct Label: Codable, HTTPDataProviding {
    
    typealias DataType = Label
    static var key = "label"

    let id: Int
    let name: String
    let color: String
    let description: String?
}

extension Label {
    
    enum Key {
        static let title = "제목"
        static let color = "색상"
        static let description = "설명"
        static let labelID = "labelId"
    }
    
    enum Constant {
        static let blank = ""
    }
}
