//
//  IssueListCollectionViewDataSource.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/02.
//

import UIKit

final class IssueListCollectionViewSetting: NSObject {
    
    private let collectionView: UICollectionView
    private let data: Issues
    private var selectedIssues = Issues()
    
    var cellMode: IssueListCellMode = .normal {
        didSet {
            guard oldValue != cellMode else { return }
            collectionView.reloadData()
        }
    }
    
    init(
        collectionView: UICollectionView,
        data: Issues,
        cellMode: IssueListCellMode = .normal) {
        self.collectionView = collectionView
        self.data = data
        self.cellMode = cellMode
        super.init()
        self.registerNib()
    }
    
    func update(selectedIssues: Issues) {
        self.selectedIssues = selectedIssues
    }

    private func registerNib() {
        let nib = UINib(nibName: Constant.issueListCollectionViewCell, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: Constant.issueListCell)
    }
}

extension IssueListCollectionViewSetting: UICollectionViewDelegate {}

extension IssueListCollectionViewSetting: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constant.issueListCell,
            for: indexPath
        )
        if let issueListCollectionViewCell = cell as? IssueListCollectionViewCell {
            configureIssueListCollectionViewCellData(issueListCollectionViewCell, at: indexPath)
            configureCellLayout(issueListCollectionViewCell)
        }
        return cell
    }
    
    private func configureIssueListCollectionViewCellData(
        _ cell: IssueListCollectionViewCell,
        at indexPath: IndexPath) {
        guard let issue = data[indexPath.row] else { return }
        cell.configureCell(with: issue)
    }
    
    private func configureCellLayout(_ cell: IssueListCollectionViewCell) {
        cell.isScrollEnabled = cellMode.enabled.isScrollEnabled
        cell.isCheckboxEnabled = cellMode.enabled.isCheckboxEnabled
    }
}
 
extension IssueListCollectionViewSetting: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: Metric.cellHeight)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath) {
        guard let cell = cell as? IssueListCollectionViewCell,
              let issue = data[indexPath.row] else { return }
        if selectedIssues.contains(issue: issue) {
            cell.updateCheckboxState(isSelected: true)
            return
        }
        cell.updateCheckboxState(isSelected: false)
    }
}

private extension IssueListCollectionViewSetting {
    
    enum Constant {
        static let issueListCell: String = "IssueListCell"
        static let issueListCollectionViewCell: String = "IssueListCollectionViewCell"
    }
    
    enum Metric {
        static let cellHeight: CGFloat = 100
        static let closeButtonWidth: CGFloat = 80
        static let deleteButtonWidth: CGFloat = 80
    }
}
