//
//  CommentDataManager.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/10.
//

import Foundation

struct CommentDataManager {
    func post(body: Comment.NewComment, successHandler: ((Int?) -> Void)? = nil,
              errorHandler: ((Error) -> Void)? = nil) {
        guard let url = IssueTrackerURL.newComment else { return }
        HTTPServiceHelper.shared.post(
            url: url,
            body: body,
            responseKeyID: Comment.NewComment.key,
            successHandler: {
                successHandler?($0.id)
            },
            errorHandler: {
                errorHandler?($0)
            }
        )
    }
}

private extension CommentDataManager {
    enum IssueTrackerURL {
        static let newComment: URL? = URL(string: "http://issue-tracker.cf/api/comment")
    }
}
