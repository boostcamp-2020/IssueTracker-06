//
//  IssueListCollectionViewCell.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/10/27.
//

import UIKit

class IssueListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var milestone: LabelView!
    @IBOutlet weak var labelsStackView: LabelsStackView!
    
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

extension String {

    var color: UIColor {
        let hex = trimmingCharacters(in: CharacterSet.alphanumerics.inverted)

        guard let int = Scanner(string: hex).scanInt32(representation: .hexadecimal) else { return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) }

        let a, r, g, b: Int32
        switch hex.count {
        case 3: (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)  // RGB (12-bit)
        case 6: (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)                    // RGB (24-bit)
        case 8: (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)       // ARGB (32-bit)
        default: (a, r, g, b) = (255, 0, 0, 0)
        }

        return UIColor(
            red: CGFloat(r) / 255.0,
            green: CGFloat(g) / 255.0,
            blue: CGFloat(b) / 255.0,
            alpha: CGFloat(a) / 255.0
        )
    }
}
