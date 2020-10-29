//
//  IssueDetailViewController.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/10/28.
//

import UIKit

class IssueDetailViewController: UIViewController {

    @IBOutlet weak var issueDetailCollectionView: UICollectionView!
    @IBOutlet weak var bottomDetailView: BottomDetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        issueDetailCollectionView.delegate = self
        issueDetailCollectionView.dataSource = self
        configurebottomView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.bottomDetailView.frame.origin.y = view.frame.height - Metric.bottomDetailViewHeight
        configurebottomViewSwipeUp()
        configurebottomViewSwipeDown()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private func configurebottomView() {
        let issue = MockupData.detailIssue
        bottomDetailView.configureView(issue: issue)
    }
    
    func configurebottomViewSwipeUp() {
        let swipe = UISwipeGestureRecognizer(
            target: self,
            action: #selector(swipeUpGesture(gesture:))
        )
        swipe.direction = .up
        bottomDetailView.addGestureRecognizer(swipe)
    }
    
    func configurebottomViewSwipeDown() {
        let swipe = UISwipeGestureRecognizer(
            target: self,
            action: #selector(swipeDownGesture(gesture:))
        )
        swipe.direction = .down
        bottomDetailView.addGestureRecognizer(swipe)
    }
    
    @objc func swipeUpGesture(gesture: UIGestureRecognizer) {
        UIView.animate(withDuration: AnimationDuration.swipeUp, animations: { [weak self] in
            guard let currentViewHeight = self?.view.frame.height,
                  let bottomViewHeight = self?.bottomDetailView.frame.height else { return }
            let nextY = currentViewHeight - bottomViewHeight
            self?.bottomDetailView.frame.origin.y = nextY
        })
    }
    
    @objc func swipeDownGesture(gesture: UIGestureRecognizer) {
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
        static let cellHeight: CGFloat = 100
        static let closeButtonWidth: CGFloat = 80
        static let deleteButtonWidth: CGFloat = 80
        static let bottomDetailViewHeight: CGFloat = 100
    }
    
    enum AnimationDuration {
        static let swipeUp: Double = 0.5
        static let swipeDown: Double = 0.5
    }
}
