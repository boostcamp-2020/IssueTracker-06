//
//  IssueDetailViewController.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/10/28.
//

import UIKit

class IssueDetailViewController: UIViewController {

    @IBOutlet private weak var issueDetailCollectionView: UICollectionView!
    @IBOutlet private weak var bottomDetailView: BottomDetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        issueDetailCollectionView.delegate = self
        issueDetailCollectionView.dataSource = self
        configurebottomViewData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureBottomViewLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private func configureBottomViewLayout() {
        bottomDetailView.frame.origin.y = view.frame.height - Metric.bottomDetailViewHeight
        configurebottomViewSwipe(direction: .up, action: #selector(swipeUp))
        configurebottomViewSwipe(direction: .down, action: #selector(swipeDown))
    }
    
    private func configurebottomViewData() {
        let issue = MockupData.detailIssue
        bottomDetailView.configureView(issue: issue)
    }
    
    private func configurebottomViewSwipe(
        direction: UISwipeGestureRecognizer.Direction,
        action: Selector) {
        let swipe = UISwipeGestureRecognizer(
            target: self,
            action: action
        )
        swipe.direction = direction
        bottomDetailView.addGestureRecognizer(swipe)
    }
    
    @objc private func swipeUp() {
        UIView.animate(withDuration: AnimationDuration.swipeUp, animations: { [weak self] in
            guard let currentViewHeight = self?.view.frame.height,
                  let bottomViewHeight = self?.bottomDetailView.frame.height else { return }
            let nextY = currentViewHeight - bottomViewHeight
            self?.bottomDetailView.frame.origin.y = nextY
        })
    }
    
    @objc private func swipeDown() {
        UIView.animate(withDuration: AnimationDuration.swipeDown, animations: { [weak self] in
            guard let currentViewHeight = self?.view.frame.height else { return }
            self?.bottomDetailView.frame.origin.y = currentViewHeight - Metric.bottomDetailViewHeight
        })
    }
}

extension IssueDetailViewController: UICollectionViewDelegate {}

extension IssueDetailViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        MockupData.detailIssue.comments.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = issueDetailCollectionView.dequeueReusableCell(
            withReuseIdentifier: Constant.issueDetailCell,
            for: indexPath
        ) as? IssueDetailCollectionViewCell else { return UICollectionViewCell() }
        
        let comment = MockupData.detailIssue.comments[indexPath.row]
        cell.configureCell(with: comment)
        cell.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constant.issueDetailHeader, for: indexPath) as? IssueDetailCollectionViewHeader
        else {
            return UICollectionReusableView()
        }
        let issue = MockupData.detailIssue
        header.configureHeader(issue: issue)
        return header
    }
}

extension IssueDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let commentText = MockupData.detailIssue.comments[indexPath.row].content
        let height = fitLabelHeight(
            text: commentText,
            width: view.bounds.width - Metric.detailCellCommentLabelWidthMargin)
        return CGSize(width: view.bounds.width, height: view.bounds.height + height)
    }
    
    private func fitLabelHeight(text: String, width: CGFloat) -> CGFloat {
        let dummyLabel = UILabel()
        dummyLabel.numberOfLines = 0
        dummyLabel.text = text
        let fitSize = dummyLabel.sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
        return fitSize.height
    }
}

extension IssueDetailViewController: IssueListViewControllerDelegate {
    func issueId(_ id: String) {
        
    }
}

private extension IssueDetailViewController {
    enum Constant {
        static let issueDetailCell: String = "IssueDetailCell"
        static let issueDetailHeader: String = "IssueDetailHeader"
    }
    
    enum Metric {
        static let cellHeight: CGFloat = 200 // 원래 100
        static let closeButtonWidth: CGFloat = 80
        static let deleteButtonWidth: CGFloat = 80
        static let bottomDetailViewHeight: CGFloat = 100
        static let detailCellCommentLabelWidthMargin: CGFloat = 30
    }
    
    enum AnimationDuration {
        static let swipeUp: Double = 0.5
        static let swipeDown: Double = 0.5
    }
}
