//
//  LabelDataProvider.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/05.
//

import Foundation

struct LabelListDataProvider {
    
    func get(
        successHandler: ((Labels?) -> Void)? = nil,
        errorHandler: ((Error) -> Void)? = nil) {
        guard let url = IssueTrackerURL.labels else { return }
        HTTPServiceHelper.shared.get(url: url, responseType: Labels.self, successHandler: {
            guard let labels = $0 else {
                successHandler?(nil)
                return
            }
            successHandler?(Labels(labels: labels))
        }, errorHandler: {
            errorHandler?($0)
        })
    }
}

private extension LabelListDataProvider {
    enum IssueTrackerURL {
        static let labels: URL? = URL(string: "http://issue-tracker.cf/api/labels")
    }
}
