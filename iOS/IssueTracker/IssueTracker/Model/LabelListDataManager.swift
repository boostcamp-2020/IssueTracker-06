//
//  LabelDataProvider.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/05.
//

import Foundation

struct LabelListDataManager {
    
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
    
    func post(body: Label, successHandler: ((String?) -> Void)? = nil, errorHandler: ((Error) -> Void)? = nil) {
        guard let url = IssueTrackerURL.label else { return }
        HTTPServiceHelper.shared.post(
            url: url,
            body: body,
            responseKeyID: Label.Key.labelID,
            successHandler: {
                successHandler?($0.id)
            },
            errorHandler: {
                errorHandler?($0)
            }
        )
    }
}

extension LabelListDataManager {
    
    static func createLabel(labelDictionary: [String:String]) -> Label? {
        guard let title = labelDictionary[Label.Key.title],
              let color = labelDictionary[Label.Key.color],
              let description = labelDictionary[Label.Key.description]
        else {
            return nil
        }
        return Label(id: .zero, name: title, color: color, description: description)
    }
}

private extension LabelListDataManager {
    
    enum IssueTrackerURL {
        static let label: URL? = URL(string: "http://issue-tracker.cf/api/label")
        static let labels: URL? = URL(string: "http://issue-tracker.cf/api/labels")
    }
}
