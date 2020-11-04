//
//  Label.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/04.
//

import Foundation

struct Labels: Codable, HTTPDataProviding {

    typealias DataType = [Label]
    static var key = "labels"

    let labels: [Label]?
}

struct Label: Codable, HTTPDataProviding {
    let id: Int
    let name: String
    let color: String
    let description: String?
}
