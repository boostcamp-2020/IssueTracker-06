//
//  MilestoneListCollectionViewCell.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/05.
//

import UIKit

final class MilestoneListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var milestoneLabelView: LabelView!
    @IBOutlet private weak var openIssueLabel: UILabel!
    @IBOutlet private weak var closedIssueLabel: UILabel!
    @IBOutlet private weak var percentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellLayout()
    }
    
    func configureCellLayout() {
        milestoneLabelView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        openIssueLabel.translatesAutoresizingMaskIntoConstraints = false
        closedIssueLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            milestoneLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            milestoneLabelView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: milestoneLabelView.leadingAnchor),
            descriptionLabel.widthAnchor.constraint(equalToConstant: bounds.width/2),
            descriptionLabel.topAnchor.constraint(equalTo: milestoneLabelView.bottomAnchor, constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: closedIssueLabel.leadingAnchor, constant: -30),
            dateLabel.leadingAnchor.constraint(equalTo: milestoneLabelView.trailingAnchor, constant: 15),
            dateLabel.centerYAnchor.constraint(equalTo: milestoneLabelView.centerYAnchor),
            percentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            percentLabel.centerYAnchor.constraint(equalTo: milestoneLabelView.centerYAnchor),
            openIssueLabel.trailingAnchor.constraint(equalTo: percentLabel.trailingAnchor),
            openIssueLabel.topAnchor.constraint(equalTo: percentLabel.bottomAnchor, constant: 15),
            closedIssueLabel.trailingAnchor.constraint(equalTo: percentLabel.trailingAnchor),
            closedIssueLabel.topAnchor.constraint(equalTo: openIssueLabel.bottomAnchor),
            closedIssueLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
    }
    
    func configure(with milestone: Milestone) {
        dateLabel.text = milestone.date
        descriptionLabel.text = milestone.description
        milestoneLabelView.text = milestone.name
    }
    
    func configure(with issues: Issues?) {
        let openCount = issues?.openCount ?? 0
        let closedCount = issues?.closedCount ?? 0
        openIssueLabel.text = "\(openCount) \(Constant.open)"
        closedIssueLabel.text = "\(closedCount) \(Constant.closed)"
        
        let percentage = openCount + closedCount == 0 ? 0 : Int((Float(closedCount) / Float(openCount + closedCount)) * 100)
        percentLabel.text = "\(percentage)%"
    }
}

private extension MilestoneListCollectionViewCell {
    
    enum Constant {
        static let open = "open"
        static let closed = "closed"
    }
}
