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
    
    func post(body: Label, successHandler: ((Int?) -> Void)? = nil, errorHandler: ((Error) -> Void)? = nil) {
        guard let url = URL(string: IssueTrackerURL.label) else { return }
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
    
    func put(body: Label, successHandler: ((Bool) -> Void)? = nil, errorHandler: ((Error) -> Void)? = nil) {
        guard let url = URL(string: "\(IssueTrackerURL.label)/\(body.id)") else { return }
        HTTPServiceHelper.shared.put(url: url, body: body, successHandler: {
            successHandler?($0)
        },
        errorHandler: {
            errorHandler?($0)
        })
    }
}

extension LabelListDataManager {
    
    static func createLabel(_ label: Label? = nil, labelDictionary: [String:String]) -> Label? {
        guard let title = labelDictionary[Label.Key.title],
              let color = labelDictionary[Label.Key.color],
              let description = labelDictionary[Label.Key.description]
        else {
            return nil
        }
        let id = label != nil ? (label?.id) ?? .zero : .zero
        return Label(id: id, name: title, color: color, description: description)
    }
}

private extension LabelListDataManager {
    
    enum IssueTrackerURL {
        static let label: String = "https://issue-tracker.cf/api/label"
        static let labels: URL? = URL(string: "http://issue-tracker.cf/api/labels")
    }
}
