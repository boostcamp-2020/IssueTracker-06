//
//  IssueDetailViewController.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/10/28.
//

import UIKit

final class IssueDetailViewController: UIViewController {

    @IBOutlet private weak var issueDetailCollectionView: UICollectionView!
    @IBOutlet private weak var bottomDetailView: BottomDetailView!
    private var issueId: Int?
    private var issue: DetailIssue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureIssueData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureBottomViewLayout()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private func configureIssueData() {
        guard let id = issueId else { return }
        DetailIssueDataManager().get(id: id, successHandler: { [weak self] in
            guard let issue = $0 else { return }
            self?.issue = issue
            self?.configureIssueDetailCollectionView()
            self?.configureBottomViewData()
        })
    }
    
    private func configureIssueDetailCollectionView() {
        issueDetailCollectionView.delegate = self
        issueDetailCollectionView.dataSource = self
    }

    private func configureBottomViewLayout() {
        bottomDetailView.frame.origin.y = view.frame.height - Metric.bottomDetailViewHeight
        bottomDetailView.frame.size = CGSize(width: view.frame.width, height: view.frame.height - 10)
        bottomDetailView.addGestureRecognizer(swipe(direction: .up, action: #selector(swipeUp)))
        bottomDetailView.addGestureRecognizer(swipe(direction: .down, action: #selector(swipeDown)))
    }

    private func configureBottomViewData() {
        guard let issue = issue else { return }
        bottomDetailView.configureView(issue: issue)
    }

    private func swipe(
        direction: UISwipeGestureRecognizer.Direction,
        action: Selector) -> UISwipeGestureRecognizer {
        let swipe = UISwipeGestureRecognizer(
            target: self,
            action: action
        )
        swipe.direction = direction
        return swipe
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CommentAddSegue" {
            guard let destination = segue.destination as? CommentAddViewController else { return }
            destination.issueId = issueId
        }
        guard let destination = segue.destination as? NewIssueAddViewController else { return }
        destination.mode = "modify"
        destination.issue = issue
    }
}

extension IssueDetailViewController: UICollectionViewDelegate {}

extension IssueDetailViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        issue?.comments.count ?? 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = issueDetailCollectionView.dequeueReusableCell(
            withReuseIdentifier: Constant.issueDetailCell,
            for: indexPath)
        
        guard let issueDetailCollectionViewCell = cell as? IssueDetailCollectionViewCell,
              let comment = issue?.comments[indexPath.row]
        else {
            return cell
        }
        issueDetailCollectionViewCell.configureCell(with: comment)
        NSLayoutConstraint.activate([
            issueDetailCollectionViewCell.widthAnchor.constraint(equalToConstant: view.bounds.width)
        ])
        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: Constant.issueDetailHeader,
            for: indexPath)
        
        guard let issueDetailCollectionViewHeader = header as? IssueDetailCollectionViewHeader,
              let issue = issue
        else {
            return header
        }
        issueDetailCollectionViewHeader.configureHeader(issue: issue)
        return header
    }
}

extension IssueDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let commentText = issue?.comments[indexPath.row].content ?? Constant.blank
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
    func issueId(_ id: Int) {
        issueId = id
    }
}

private extension IssueDetailViewController {
    enum Constant {
        static let issueDetailCell: String = "IssueDetailCell"
        static let issueDetailHeader: String = "IssueDetailHeader"
        static let blank: String = ""
    }

    enum Metric {
        static let cellHeight: CGFloat = 100
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
