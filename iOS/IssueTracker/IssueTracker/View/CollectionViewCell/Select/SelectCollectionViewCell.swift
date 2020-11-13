//
//  SelectCollectionViewCell.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/12.
//

import UIKit

class SelectCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var labelView: LabelView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var checkImageView: UIImageView!
    
    func configureCell(with label: Label) {
        labelView.backgroundColor = label.color.color
        labelView.text = label.name
        descriptionLabel.text = label.description
    }
    
    func configureCell(with milestone: Milestone) {
        labelView.text = milestone.name
        descriptionLabel.text = milestone.description
    }
    
    func updateCheckState(isSelected: Bool) {
        checkImageView.isHidden = !isSelected
    }
}
