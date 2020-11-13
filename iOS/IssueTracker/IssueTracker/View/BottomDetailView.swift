//
//  BottomDetailView.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/10/29.
//

import UIKit

final class BottomDetailView: UIView {
    
    @IBOutlet private weak var assigneeStackView: AssigneeStackView!
    @IBOutlet private weak var labelStackView: LabelsStackView!
    @IBOutlet weak var issueStatusButton: UIButton!
    @IBOutlet weak var milestoneProgressView: UIProgressView!
    @IBOutlet weak var milestoneTitleLabel: UILabel!

    func configureView(issue: DetailIssue) {
        milestoneTitleLabel.text = issue.milestone?.name ?? .none
        configureIssueStatusButton(isOpen: issue.isOpen)
        configureAssigneeStackView(assignee: issue.assignee)
        configureLabelStackView(labels: issue.labels)
    }
    
    func configureMilestoneView(issues: Issues) {
        let openCount = issues.openCount
        let closedCount = issues.closedCount
        let progress = openCount + closedCount == 0 ? 0 : (Float(closedCount) / Float(openCount + closedCount))
        milestoneProgressView.progress = progress
    }
    
    private func configureIssueStatusButton(isOpen: Bool) {
        if !isOpen {
            issueStatusButton.setTitle(Constant.reopenIssue, for: .normal)
            issueStatusButton.setTitleColor(.none, for: .normal)
            return
        }
        issueStatusButton.setTitle(Constant.closeIssue, for: .normal)
        issueStatusButton.setTitleColor(Color.close, for: .normal)
    }

    private func configureAssigneeStackView(assignee: [User]) {
        assigneeStackView.clear()

        assignee.forEach {
            let assigneeView = AssigneeView.create(user: $0)
            assigneeStackView.add(assigneeView: assigneeView)
        }
    }

    private func configureLabelStackView(labels: [Label]) {
        labelStackView.clear()

        labels.forEach {
            let labelView = LabelView.create(text: $0.name, color: $0.color.color)
            labelStackView.add(label: labelView)
        }
    }
}

private extension BottomDetailView {
    
    enum Constant {
        static let reopenIssue: String = "Reopen Issue"
        static let closeIssue: String = "Close Issue"
    }
    
    enum Color {
        static let close: UIColor = .init(red: 190/255, green: 59/255, blue: 61/255, alpha: 1)
    }
}
