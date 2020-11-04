//
//  IssueListDataProvider.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/04.
//

import Foundation

struct IssueListDataProvider {
    
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
}

private extension IssueListDataProvider {
    enum IssueTrackerURL {
        static let issues: URL? = URL(string: "http://issue-tracker.cf/api/issues")
    }
}
