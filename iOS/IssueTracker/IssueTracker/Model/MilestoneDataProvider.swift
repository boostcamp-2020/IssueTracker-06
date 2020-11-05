//
//  MilestoneDataProvider.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/05.
//

import Foundation

struct MilestoneDataProvider {
    func get(successHandler: ((Milestones?) -> Void)? = nil, errorHandler: ((Error) -> Void)? = nil) {
        guard let url = IssueTrackerURL.milestones else { return }
        HTTPServiceHelper.shared.get(url: url, responseType: Milestones.self, successHandler: {
            guard let milestones = $0 else {
                successHandler?(nil)
                return
            }
            successHandler?(Milestones(milestones: milestones))
        }, errorHandler: {
            errorHandler?($0)
        })
    }
}

private extension MilestoneDataProvider {
    enum IssueTrackerURL {
        static let milestones = URL(string: "http://issue-tracker.cf/api/milestones")
    }
}
