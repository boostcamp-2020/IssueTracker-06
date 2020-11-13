//
//  IssueDetailCollectionViewHeader.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/10/28.
//

import UIKit

final class IssueDetailCollectionViewHeader: UICollectionReusableView {
    
    @IBOutlet private weak var headerContentView: UIView!
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var issueNumberLabel: UILabel!
    @IBOutlet private weak var issueStateView: IssueStateView!
    
    func configureHeader(issue: DetailIssue) {
        usernameLabel.text = issue.user.name
        titleLabel.text = issue.title
        issueNumberLabel.text = "#\(issue.id)"
        issueStateView.updateState(enabled: issue.isOpen)
        // 이미지 추가
        guard let url = URL(string: issue.user.profile) else { return }
        do {
            let data = try Data(contentsOf: url)
            profileImageView.image = UIImage(data: data)
        } catch {
            return
        }
    }
}
