//
//  MockupData.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/10/27.
//

import Foundation

struct MockupData {
    static let data: [Issue] = [
        Issue(id: "id", title: "레이블 목록 보기 구현", description: "레비블 전체 목록을 볼 수 있어야 한다\n2줄까지 보입니다.", milestone: "스프린트2", labels: [Label(name: "feature", color: "#C4DAFA", description: "")]),
        Issue(id: "id", title: "마일스톤 목록 보기 구현", description: "마일스톤 전체 목록을 볼 수 있어야 한다\n길면 뒷 부분이 ... 잘린다", milestone: "스프린트2", labels: [Label(name: "bug", color: "#FF5D5D", description: ""), Label(name: "feature", color: "#C4DAFA", description: "")])
    ]
    
    static let users: [User] = [
        User(image: "", name: "godrm"),
        User(image: "", name: "crong"),
        User(image: "", name: "honux")
    ]
    
    static let detailIssue = DetailIssue(
        user: User(image: "", name: "godrm"), title: "이슈 생성 기능",
        issueNumber: "11",
        comments: [
            Comment(user: User(image: "", name: "taehee"), timestamp: "16 minutes ago", content: "레이블 전체 목록을 볼 수 있는게 어떨까요"),
            Comment(user: User(image: "", name: "godrm"), timestamp: "16 minutes ago", content: "레이블 전체 목록을 볼 수 있는게 어떨까요\n전체 설명이 보여야 선택할 수 있으니까\n\n마크다운 문법을 지원하고\nHTML형태로 보여줘야 할까요"),
            Comment(user: User(image: "", name: "crong"), timestamp: "16 minutes ago", content: "레이블 전체 목록을 볼 수 있는게 어떨까요\n전체 설명이 보여야 선택할 수 있으니까\n\n마크다운 문법을 지원하고\nHTML형태로 보여줘야 할까요 111111111111111111111111111111111111111111111111111111111111111111"),
            Comment(user: User(image: "", name: "honux"), timestamp: "16 minutes ago", content: "레이블 전체 목록을 볼 수 있는게 어떨까요\n전체 설명이 보여야 선택할 수 있으니까\n\n마크다운 문법을 지원하고\nHTML형태로 보여줘야 할까요111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"),
        ],
        enabled: false,
        milestone: Milestone(),
        labels: [
            Label(name: "enhancement", color: "#B3ECEE", description: "")
        ],
        assignee: [
            User(image: "", name: "godrm")
        ])
}
