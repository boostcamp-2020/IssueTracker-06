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
        setCellLayout()
    }
    
    func setCellLayout() {
        milestoneLabelView.translatesAutoresizingMaskIntoConstraints = false
        descriptionMilestone.translatesAutoresizingMaskIntoConstraints = false
        date.translatesAutoresizingMaskIntoConstraints = false
        percent.translatesAutoresizingMaskIntoConstraints = false
        openIssue.translatesAutoresizingMaskIntoConstraints = false
        closedIssue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            milestoneLabelView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            milestoneLabelView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            descriptionMilestone.leadingAnchor.constraint(equalTo: milestoneLabelView.leadingAnchor),
            descriptionMilestone.widthAnchor.constraint(equalToConstant: self.bounds.width/2),
            descriptionMilestone.topAnchor.constraint(equalTo: milestoneLabelView.bottomAnchor, constant: 15),
            date.leadingAnchor.constraint(equalTo: milestoneLabelView.trailingAnchor, constant: 15),
            date.topAnchor.constraint(equalTo: milestoneLabelView.topAnchor),
            percent.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            percent.topAnchor.constraint(equalTo: milestoneLabelView.topAnchor),
            openIssue.trailingAnchor.constraint(equalTo: percent.trailingAnchor),
            openIssue.topAnchor.constraint(equalTo: percent.bottomAnchor, constant: 15),
            closedIssue.trailingAnchor.constraint(equalTo: percent.trailingAnchor),
            closedIssue.topAnchor.constraint(equalTo: openIssue.bottomAnchor, constant: 5)
        ])
    }
    
    func setMilestone(milestone: Milestone) {
        date.text = milestone.date
        descriptionMilestone.text = milestone.description
        descriptionMilestone.numberOfLines = 1
        milestoneLabelView.text = milestone.name
        milestoneLabelView.sizeToFit()
    }
}
