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

    func configureView(issue: DetailIssue) {
        configureAssigneeStackView(assignee: issue.assignee)
        configureLabelStackView(labels: issue.labels)
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
