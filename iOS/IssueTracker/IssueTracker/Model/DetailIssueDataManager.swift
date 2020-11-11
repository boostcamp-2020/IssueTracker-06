//
//  DetailIssueDataProvider.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/04.
//

import Foundation

struct DetailIssueDataManager {
    
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
    
    func patchTitle(
        id: Int,
        body: DetailIssue.patchTitleDetailIssue,
        successHandler: ((Bool) -> Void)? = nil,
        errorHandler: ((Error) -> Void)? = nil) {
        guard let url = URL(string: "\(IssueTrackerURL.patchIssue)/\(id)/title") else { return }
        HTTPServiceHelper.shared.patch(url: url, body: body, successHandler: {
            successHandler?($0)
        }, errorHandler: { error in
            errorHandler?(error)
        })
    }
    
    func patchContent(
        id: Int,
        body: DetailIssue.patchContentDetailIssue,
        successHandler: ((Bool) -> Void)? = nil,
        errorHandler: ((Error) -> Void)? = nil) {
        guard let url = URL(string: "\(IssueTrackerURL.patchIssue)/\(id)/content") else { return }
        HTTPServiceHelper.shared.patch(url: url, body: body, successHandler: {
            successHandler?($0)
        }, errorHandler: { error in
            errorHandler?(error)
        })
    }
    
}

private extension DetailIssueDataManager {
    enum IssueTrackerURL {
        static let patchIssue: String = "http://issue-tracker.cf/api/issue"
        static let issue: String = "http://issue-tracker.cf/api/issue"
    }
}
