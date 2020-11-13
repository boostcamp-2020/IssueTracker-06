//
//  SelectUserCollectionViewCell.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/13.
//

import UIKit

class SelectUserCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var checkImageView: UIImageView!
    @IBOutlet private weak var userImageVIew: UIImageView!
    
    func configureCell(with user: User) {
        userNameLabel.text = user.name
    }
    
    func updateCheckState(isSelected: Bool) {
        checkImageView.isHidden = !isSelected
    }
    
    func configureImage(with url: String) {
        userImageVIew.image = UIImage(named: url)
    }
}
