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
    
    func post(body: Issue.NewIssue, successHandler: ((Int?) -> Void)? = nil,
              errorHandler: ((Error) -> Void)? = nil) {
        guard let url = IssueTrackerURL.newIssue else { return }
        HTTPServiceHelper.shared.post(
            url: url,
            body: body,
            responseKeyID: Issue.NewIssue.key,
            successHandler: {
                successHandler?($0.id)
            },
            errorHandler: {
                errorHandler?($0)
            }
        )
    }
}

private extension IssueListDataManager {
    enum IssueTrackerURL {
        static let issues: URL? = URL(string: "http://issue-tracker.cf/api/issues")
        static let newIssue: URL? = URL(string: "http://issue-tracker.cf/api/issue")
    }
}
