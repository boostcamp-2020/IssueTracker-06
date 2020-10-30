//
//  IssueDetailCollectionViewHeader.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/10/28.
//

import UIKit

class IssueDetailCollectionViewHeader: UICollectionReusableView {
    @IBOutlet weak var headerContentView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var issueNumberLabel: UILabel!
    @IBOutlet weak var issueStateView: IssueStateView!
    
    func configureHeader(issue: DetailIssue) {
        usernameLabel.text = issue.user.name
        titleLabel.text = issue.title
        issueNumberLabel.text = "#\(issue.issueNumber)"
        issueStateView.updateState(enabled: issue.enabled)
    }
}
