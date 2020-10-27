//
//  MockupData.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/10/27.
//

import Foundation

struct MockupData {
    static let data: [Issue] = [
        Issue(title: "레이블 목록 보기 구현", description: "레비블 전체 목록을 볼 수 있어야 한다", milestone: "스프린트2", labels: [Label(name: "feature", color: "#C4DAFA", description: "")]),
        Issue(title: "마일스톤 목록 보기 구현", description: "마일스톤 전체 목록을 볼 수 있어야 한다", milestone: "스프린트2", labels: [Label(name: "bug", color: "#FF5D5D", description: ""), Label(name: "feature", color: "#C4DAFA", description: "")])
    ]
}

