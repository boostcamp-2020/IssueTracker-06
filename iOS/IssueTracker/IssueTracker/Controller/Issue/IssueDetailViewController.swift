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
    private let dataManager = DetailIssueDataManager()
    private var issueId: Int?
    private var issue: DetailIssue? {
        didSet {
            issueDetailCollectionView.reloadData()
            configureBottomViewData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureIssueData() { [weak self] in
            self?.configureIssueDetailCollectionView()
        }
        configureRefreshControl()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureBottomViewLayout()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constant.commentAddSegue {
            guard let destination = segue.destination as? CommentAddViewController else { return }
            destination.issueId = issueId
        }
        guard let destination = segue.destination as? NewIssueAddViewController else { return }
        destination.mode = Constant.modifyMode
        destination.issue = issue
    }
    
    // 이슈 상태 버튼 액션 추가
    // 이슈 상태 변경
    @IBAction private func issueStateButtonPressed() {
        guard let id = issueId,
              let issueStatus = issue?.isOpen
        else {
            return
        }
        DetailIssueDataManager().patchIssueStatus(
            id: id,
            body: DetailIssue.IssueStatus(isOpen: !issueStatus),
            successHandler: { [weak self] _ in
                self?.issue?.updateState(isOpen: !issueStatus)
            }
        )
    }
}

// MARK: configure
private extension IssueDetailViewController {
    
    func configureRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshIssues), for: .valueChanged)
        issueDetailCollectionView.refreshControl = refreshControl
    }
    
    @objc func refreshIssues(_ refresh: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            refresh.endRefreshing()
        })
        configureIssueData() {
            refresh.endRefreshing()
        }
    }
    
    func configureIssueData(completionHandler: (() -> Void)? = nil) {
        defer {
            completionHandler?()
        }
        guard let id = issueId else { return }
        dataManager.get(id: id, successHandler: { [weak self] in
            guard let issue = $0 else { return }
            self?.issue = issue
            guard let milestoneName = issue.milestone?.name else { return }
            self?.configureMilestoneIssues(milestoneName: milestoneName)
        })
    }
    
    func configureMilestoneIssues(milestoneName: String) {
        dataManager.getMilestoneIssues(
            name: milestoneName,
            successHandler: { [weak self] issues in
                guard let issues = issues else { return }
                self?.configureBottomViewMilestone(issues: issues)
            }
        )
    }
    
    func configureIssueDetailCollectionView() {
        issueDetailCollectionView.delegate = self
        issueDetailCollectionView.dataSource = self
    }

    func configureBottomViewLayout() {
        bottomDetailView.frame.origin.y = view.frame.height - Metric.bottomDetailViewHeight
        bottomDetailView.frame.size = CGSize(width: view.frame.width, height: view.frame.height - 10)
        bottomDetailView.addGestureRecognizer(swipe(direction: .up, action: #selector(swipeUp)))
        bottomDetailView.addGestureRecognizer(swipe(direction: .down, action: #selector(swipeDown)))
    }

    func configureBottomViewData() {
        guard let issue = issue else { return }
        bottomDetailView.configureView(issue: issue)
    }
    
    func configureBottomViewMilestone(issues: Issues) {
        bottomDetailView.configureMilestoneView(issues: issues)
    }
}

// MARK: swipe
private extension IssueDetailViewController {
    
    func swipe(
        direction: UISwipeGestureRecognizer.Direction,
        action: Selector) -> UISwipeGestureRecognizer {
        let swipe = UISwipeGestureRecognizer(
            target: self,
            action: action
        )
        swipe.direction = direction
        return swipe
    }

    @objc func swipeUp() {
        UIView.animate(withDuration: AnimationDuration.swipeUp, animations: { [weak self] in
            guard let currentViewHeight = self?.view.frame.height,
                  let bottomViewHeight = self?.bottomDetailView.frame.height else { return }
            let nextY = currentViewHeight - bottomViewHeight
            self?.bottomDetailView.frame.origin.y = nextY
        })
    }

    @objc func swipeDown() {
        UIView.animate(withDuration: AnimationDuration.swipeDown, animations: { [weak self] in
            guard let currentViewHeight = self?.view.frame.height else { return }
            self?.bottomDetailView.frame.origin.y = currentViewHeight - Metric.bottomDetailViewHeight
        })
    }
}

// MARK: up, down 버튼 클릭시 해당 셀로 포커스
private extension IssueDetailViewController {
    
    func currentIndexPath() -> IndexPath? {
        issueDetailCollectionView.indexPathForItem(at: focusCurrentCell())
    }
    
    func focusCurrentCell() -> CGPoint{
        var visibleRect = CGRect()
        visibleRect.origin = issueDetailCollectionView.contentOffset
        visibleRect.size = issueDetailCollectionView.bounds.size
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        return visiblePoint
    }
    
    @IBAction func cellFocusUp() {
        guard let indexPath = currentIndexPath() else { return }
        let nextIndexPath = IndexPath(row: indexPath.row - 1, section: indexPath.section)
        issueDetailCollectionView.scrollToItem(at: nextIndexPath, at: .centeredVertically, animated: true)
    }
    
    @IBAction func cellFocusDown() {
        guard let indexPath = currentIndexPath() else { return }
        let nextIndexPath = IndexPath(row: indexPath.row + 1, section: indexPath.section)
        issueDetailCollectionView.scrollToItem(at: nextIndexPath, at: .centeredVertically, animated: true)
    }
}

// MARK: 하단뷰 편집화면 띄우기
private extension IssueDetailViewController {
    
    @IBAction func assigneeEditButtonTouched(_ sender: UIButton) {
        guard let snapshotView = UIApplication.snapshotView else { return }
        let selectViewController = SelectViewController(dataType: .assignee)
        selectViewController.setBackground(view: snapshotView)
        selectViewController.modalPresentationStyle = .fullScreen
        selectViewController.selectedHandler = updateIssueAssignee
        present(selectViewController, animated: false)
    }
    
    @IBAction func labelEditButtonTouched(_ sender: UIButton) {
        guard let snapshotView = UIApplication.snapshotView else { return }
        let selectViewController = SelectViewController(dataType: .label)
        selectViewController.setBackground(view: snapshotView)
        selectViewController.modalPresentationStyle = .fullScreen
        selectViewController.selectedHandler = updateIssueLabel
        present(selectViewController, animated: false)
    }
    
    @IBAction func milestoneEditButtonTouched(_ sender: UIButton) {
        guard let snapshotView = UIApplication.snapshotView else { return }
        let selectViewController = SelectViewController(dataType: .milestone)
        selectViewController.setBackground(view: snapshotView)
        selectViewController.modalPresentationStyle = .fullScreen
        selectViewController.selectedHandler = updateIssueMilestone
        present(selectViewController, animated: false)
    }
}

// MARK: 하단뷰 데이터 변경
private extension IssueDetailViewController {
    
    func updateIssueAssignee(selectedData: Codable) {
        guard let assignees = selectedData as? [User],
              let issue = issue
        else {
            return
        }
        dataManager.updateAssignee(
            id: issue.id,
            targets: assignees.map { $0.id },
            successHandler: { _ in
            }
        )
    }
    
    func updateIssueLabel(selectedData: Codable) {
        guard let labels = selectedData as? Labels,
              let issue = issue
        else {
            return
        }
        dataManager.updateLabel(
            id: issue.id,
            targets: labels.id,
            successHandler: { _ in
            }
        )
    }
    
    func updateIssueMilestone(selectedData: Codable) {
        guard let milestone = selectedData as? Milestone,
              let issue = issue
        else {
            return
        }
        dataManager.updateMilestone(
            id: issue.id,
            target: milestone.id,
            successHandler: { _ in
            }
        )
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
        ImageDataManager().get(id: comment.user.id, successHandler: {
            issueDetailCollectionViewCell.configureImage(with: $0)
        })
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
        ImageDataManager().get(id: issue.user.id, successHandler: {
            issueDetailCollectionViewHeader.configureImage(with: $0)
        })
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
        static let modifyMode: String = "modify"
        static let commentAddSegue: String = "CommentAddSegue"
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
