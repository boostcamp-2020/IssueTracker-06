//
//  MilestoneListCollectionViewCell.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/05.
//

import UIKit

class MilestoneListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var descriptionMilestone: UILabel!
    @IBOutlet weak var milestoneLabelView: LabelView!
    @IBOutlet weak var openIssue: UILabel!
    @IBOutlet weak var closedIssue: UILabel!
    @IBOutlet weak var percent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellLayout()
    }
    
    func configureCellLayout() {
        milestoneLabelView.translatesAutoresizingMaskIntoConstraints = false
        descriptionMilestone.translatesAutoresizingMaskIntoConstraints = false
        date.translatesAutoresizingMaskIntoConstraints = false
        percent.translatesAutoresizingMaskIntoConstraints = false
        openIssue.translatesAutoresizingMaskIntoConstraints = false
        closedIssue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            milestoneLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            milestoneLabelView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            descriptionMilestone.leadingAnchor.constraint(equalTo: milestoneLabelView.leadingAnchor),
            descriptionMilestone.widthAnchor.constraint(equalToConstant: bounds.width/2),
            descriptionMilestone.topAnchor.constraint(equalTo: milestoneLabelView.bottomAnchor, constant: 15),
            date.leadingAnchor.constraint(equalTo: milestoneLabelView.trailingAnchor, constant: 15),
            date.centerYAnchor.constraint(equalTo: milestoneLabelView.centerYAnchor),
            percent.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            percent.centerYAnchor.constraint(equalTo: milestoneLabelView.centerYAnchor),
            openIssue.trailingAnchor.constraint(equalTo: percent.trailingAnchor),
            openIssue.topAnchor.constraint(equalTo: percent.bottomAnchor, constant: 15),
            closedIssue.trailingAnchor.constraint(equalTo: percent.trailingAnchor),
            closedIssue.topAnchor.constraint(equalTo: openIssue.bottomAnchor),
            closedIssue.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])
    }
    
    func configure(with milestone: Milestone) {
        date.text = milestone.date
        descriptionMilestone.text = milestone.description
        descriptionMilestone.numberOfLines = 1
        milestoneLabelView.text = milestone.name
        milestoneLabelView.sizeToFit()
    }
    
    func configure(with issues: Issues?) {
        let openCount = issues?.openCount ?? 0
        let closedCount = issues?.closedCount ?? 0
        openIssue.text = "\(openCount) \(Constant.open)"
        closedIssue.text = "\(closedCount) \(Constant.closed)"
        
        let percentage = openCount + closedCount == 0 ? 0 : Int((Float(closedCount) / Float(openCount + closedCount)) * 100)
        percent.text = "\(percentage)%"
    }
}

private extension MilestoneListCollectionViewCell {
    enum Constant {
        static let open = "open"
        static let closed = "closed"
    }
}
