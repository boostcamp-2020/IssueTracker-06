//
//  IssueDetailCollectionViewCell.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/10/28.
//

import UIKit

final class IssueDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var writingTime: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var emojiButton: UIButton!
    @IBOutlet weak var optionButton: UIButton!
    
    func configureCell(with comment: Comment) {
        id.text = comment.user.name
        writingTime.text = comment.timestamp
        commentLabel.text = comment.content
    }
}
