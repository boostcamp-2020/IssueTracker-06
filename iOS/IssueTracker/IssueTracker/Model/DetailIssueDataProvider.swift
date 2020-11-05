//
//  DetailIssueDataProvider.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/04.
//

import Foundation

struct DetailIssueDataProvider {
    
    func get(
        id: Int,
        successHandler: ((DetailIssue?) -> Void)? = nil,
        errorHandler: ((Error) -> Void)? = nil) {
        guard let url = URL(string: "\(IssueTrackerURL.issue)/\(id)") else { return }
        HTTPServiceHelper.shared.get(url: url, responseType: DetailIssue.self, successHandler: {
            guard let issue = $0 else {
                successHandler?(nil)
                return
            }
            successHandler?(issue)
        }, errorHandler: {
            errorHandler?($0)
        })
    }
}

private extension DetailIssueDataProvider {
    enum IssueTrackerURL {
        static let issue: String = "http://issue-tracker.cf/api/issue"
    }
}
