//
//  IssueListCollectionViewCell.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/02.
//

import UIKit

class IssueListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
        @IBOutlet weak var titleLabel: UILabel!
        @IBOutlet weak var descriptionLabel: UILabel!
        @IBOutlet weak var milestone: LabelView!
        @IBOutlet weak var labelsStackView: LabelsStackView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setIssue(_ issue: Issue) {
        titleLabel.text = issue.title
        descriptionLabel.text = issue.description
        milestone.text = issue.milestone
        setLabelsStackView(labels: issue.labels)
    }

    func setWidth(_ width: CGFloat) {
        widthConstraint.constant = width
    }

    private func setLabelsStackView(labels: [Label]) {
        labelsStackView.clear()
        labels.forEach {
            let label = LabelView.create(text: $0.name, color: $0.color.color)
            labelsStackView.add(label: label)
        }
    }
}
