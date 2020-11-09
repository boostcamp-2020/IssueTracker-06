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
    
    func getIssues(name: String, successHandler: ((Issues?) -> Void)? = nil, errorHandler: ((Error) -> Void)? = nil) {
        
        var urlString = IssueTrackerURL.issues
        urlString.append(name)
        guard let url = URL(string: urlString) else {
            return }
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

extension MilestoneDataProvider {
    
    static func createMilestone(milestoneDictionary: [String: String]) -> Milestone? {
        guard let title = milestoneDictionary[Milestone.Key.title],
              let completeDate = milestoneDictionary[Milestone.Key.completeDate],
              let description = milestoneDictionary[Milestone.Key.description]
        else {
            return nil
        }
        return Milestone(
            date: completeDate,
            description: description,
            id: .zero,
            isOpen: 1,
            name: title
        )
    }
}

private extension MilestoneDataProvider {
    enum IssueTrackerURL {
        static let milestones = URL(string: "http://issue-tracker.cf/api/milestones")
        static let issues = "http://issue-tracker.cf/api/issues?milestone="
    }
}
