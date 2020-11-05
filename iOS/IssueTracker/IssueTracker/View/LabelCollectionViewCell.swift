//
//  LabelCollectionViewCell.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/05.
//

import UIKit

class LabelCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelView: LabelView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureWidth()
    }
    
    func configureCell(with label: Label) {
        labelView.backgroundColor = label.color.color
        labelView.text = label.name
        descriptionLabel.text = label.description
    }
    
    private func configureWidth() {
        widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    }
}
