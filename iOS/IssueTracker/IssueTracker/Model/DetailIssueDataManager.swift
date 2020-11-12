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
    
    func patchIssueStatus(
        id: Int,
        body: DetailIssue.IssueStatus,
        successHandler: ((Bool) -> Void)? = nil,
        errorHandler: ((Error) -> Void)? = nil) {
        guard let url = URL(string: "\(IssueTrackerURL.issueState)/\(id)/status") else { return }
        HTTPServiceHelper.shared.patch(url: url, body: body, successHandler: {
            successHandler?($0)
        }, errorHandler: { error in
            errorHandler?(error)
        })
    }
    
    func getMilestoneIssues(
        name: String,
        successHandler: ((Issues?) -> Void)? = nil,
        errorHandler: ((Error) -> Void)? = nil) {
        
        let processedName = name.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        guard let url = URL(string: IssueTrackerURL.milestoneIssues(name: processedName))
        else {
            return
        }
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

private extension DetailIssueDataManager {
    enum IssueTrackerURL {
        static let patchIssue: String = "http://issue-tracker.cf/api/issue"
        static let issue: String = "http://issue-tracker.cf/api/issue"
        static let issueState: String = "http://issue-tracker.cf/api/issue"
        static func milestoneIssues(name: String) -> String {
            "http://issue-tracker.cf/api/issues?milestone=\(name)"
        }
    }
}
