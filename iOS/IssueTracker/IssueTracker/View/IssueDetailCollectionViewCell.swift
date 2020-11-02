//
//  IssueDetailCollectionViewCell.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/10/28.
//

import UIKit

final class IssueDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var cellView: UIView!
    @IBOutlet private weak var userImage: UIImageView!
    @IBOutlet private weak var id: UILabel!
    @IBOutlet private weak var writingTime: UILabel!
    @IBOutlet private weak var commentLabel: UILabel!
    @IBOutlet private weak var emojiButton: UIButton!
    @IBOutlet private weak var optionButton: UIButton!
    
    func configureCell(with comment: Comment) {
        id.text = comment.user.name
        writingTime.text = comment.timestamp
        commentLabel.text = comment.content
    }
}
