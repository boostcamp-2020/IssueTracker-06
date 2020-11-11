//
//  IssueListDataProvider.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/04.
//

import Foundation

struct IssueListDataManager {
    
    func get(successHandler: ((Issues?) -> Void)? = nil, errorHandler: ((Error) -> Void)? = nil) {
        guard let url = IssueTrackerURL.issues else { return }
        HTTPServiceHelper.shared.get(url: url, responseType: Issues.self, successHandler: {
            guard let issues = $0 else {
                successHandler?(nil)
                return
            }
            successHandler?(Issues(issues: issues))
        }, errorHandler: {
            errorHandler?($0)
        })
    }
    
    func updateStatus(
        id: Int,
        status: Bool,
        successHandler: (() -> Void)? = nil,
        errorHandler: ((Error) -> Void)? = nil) {
        guard let url = URL(string: IssueTrackerURL.issueStatusURL(id: id)) else { return }
        let body = [Constant.isOpen: status]
        HTTPServiceHelper.shared.patch(url: url, body: body, successHandler: { _ in
            successHandler?()
        },
        errorHandler: {
            errorHandler?($0)
        })
    }
}

private extension IssueListDataManager {
    
    enum IssueTrackerURL {
        static let issues: URL? = URL(string: "http://issue-tracker.cf/api/issues")
        
        static func issueStatusURL(id: Int) -> String {
            "http://issue-tracker.cf/api/issue/\(id)/status"
        }
    }
    
    enum Constant {
        static let isOpen = "isOpen"
    }
}
