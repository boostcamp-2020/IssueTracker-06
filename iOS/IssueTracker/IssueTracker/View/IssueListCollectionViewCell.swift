//
//  IssueListCollectionViewCell.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/02.
//

import UIKit

final class IssueListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var milestone: LabelView!
    @IBOutlet private weak var labelsStackView: LabelsStackView!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    @IBAction private func checkboxTouched(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
        
    func disableCheckbox() {
        frame.origin.x = -55
        frame.size.width += 55
    }
    
    func disableScroll() {
        scrollView.isScrollEnabled = false
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
