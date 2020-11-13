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
    @IBOutlet private weak var milestoneView: LabelView!
    @IBOutlet private weak var labelsStackView: LabelsStackView!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var checkboxButton: UIButton!
    @IBOutlet private weak var checkboxLeadingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var issueStateView: UIImageView!
    
    var closeButtonHandler: ((UICollectionViewCell) -> Void)?
    var deleteButtonHandler: ((UICollectionViewCell) -> Void)?

    var isCheckboxEnabled: Bool = false {
        didSet {
            guard oldValue == !isCheckboxEnabled else { return }
            changeCheckboxMode(isCheckboxEnabled: isCheckboxEnabled)
        }
    }
    
    var isScrollEnabled: Bool = true {
        didSet {
            changeScrollMode(isScrollEnabled: isScrollEnabled)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureWidth()
    }
    
    func configureCell(with issue: Issue) {
        titleLabel.text = issue.title
        descriptionLabel.text = issue.content
        configureLabelsStackView(labels: issue.labels)

        guard let milestone = issue.milestone else {
            milestoneView.isHidden = true
            return
        }
        milestoneView.text = milestone.name
    }
    
    func configureIssueStateView(isOpen: Bool) {
        let color = isOpen ? Color.open : Color.close
        issueStateView.tintColor = color
    }
    
    func updateCheckboxState(isSelected: Bool) {
        checkboxButton.isSelected = isSelected
    }
    
    @IBAction func closeButtonTouched(_ sender: UIButton) {
        closeButtonHandler?(self)
    }
    
    @IBAction func deleteButtonTouched(_ sender: UIButton) {
        deleteButtonHandler?(self)
    }
}

// MARK: configure
private extension IssueListCollectionViewCell {
    
    func configureWidth() {
        widthConstraint.constant = UIScreen.main.bounds.width
            + Metric.closeButtonWidth + Metric.deleteButtonWidth
    }

    func configureLabelsStackView(labels: [Label]) {
        labelsStackView.clear()
        labels.forEach {
            let label = LabelView.create(text: $0.name, color: $0.color.color)
            labelsStackView.add(label: label)
        }
    }
}

// MARK: Checkbox
private extension IssueListCollectionViewCell {
    
    func changeCheckboxMode(isCheckboxEnabled: Bool) {
        let animation = isCheckboxEnabled ? ableCheckbox : disableCheckbox
        animate(animation)
    }
    
    func disableCheckbox() {
        checkboxLeadingConstraint.constant = -40
    }
    
    func ableCheckbox() {
        checkboxLeadingConstraint.constant = 15
    }
    
    func animate(_ animation: @escaping (() -> Void)) {
        layoutIfNeeded()
        UIView.animate(withDuration: AnimationDuration.move, animations: { [weak self] in
            animation()
            self?.layoutIfNeeded()
        })
    }
}

// MARK: ScrollView
private extension IssueListCollectionViewCell {
    
     func changeScrollMode(isScrollEnabled: Bool) {
        scrollView.isScrollEnabled = isScrollEnabled
    }
}

private extension IssueListCollectionViewCell {
    
    enum Metric {
        static let closeButtonWidth: CGFloat = 80
        static let deleteButtonWidth: CGFloat = 80
    }
    
    enum AnimationDuration {
        static let move: Double = 0.5
    }
    
    enum Color {
        static let open: UIColor = .init(red: 60/255, green: 117/255, blue: 60/255, alpha: 1)
        static let close: UIColor = .init(red: 187/255, green: 54/255, blue: 56/255, alpha: 1)
    }
}