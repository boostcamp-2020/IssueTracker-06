//
//  ViewController.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/10/27.
//

import UIKit

final class IssueListViewController: UIViewController {

    @IBOutlet weak var issueListCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupIssueListCollectionView()
        removeNavigationBarUnderLine()
    }
    
    private func setupIssueListCollectionView() {
        issueListCollectionView.delegate = self
        issueListCollectionView.dataSource = self
    }
    
    private func removeNavigationBarUnderLine() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
}

extension IssueListViewController: UICollectionViewDelegate {
        
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return MockupData.data.count
    }
}

extension IssueListViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = issueListCollectionView.dequeueReusableCell(
            withReuseIdentifier: Constant.issueListCell,
            for: indexPath
        )
        if let issueListCollectionViewCell = cell as? IssueListCollectionViewCell {
            setIssueListCollectionViewCellWidth(issueListCollectionViewCell)
            setIssueListCollectionViewCellData(issueListCollectionViewCell, at: indexPath)
        }
        return cell
    }
    
    private func setIssueListCollectionViewCellWidth(_ cell: IssueListCollectionViewCell) {
        let cellwidth: CGFloat = issueListCollectionView.bounds.width + Metric.closeButtonWidth + Metric.deleteButtonWidth
        cell.setWidth(cellwidth)
    }
    
    private func setIssueListCollectionViewCellData(_ cell: IssueListCollectionViewCell, at indexPath: IndexPath) {
        let issue = MockupData.data[indexPath.row]
        cell.setIssue(issue)
    }
}

extension IssueListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: issueListCollectionView.bounds.width, height: Metric.cellHeight)
    }
}

private extension IssueListViewController {
    enum Constant {
        static let issueListCell: String = "IssueListCell"
    }
    
    enum Metric {
        static let cellHeight: CGFloat = 100
        static let closeButtonWidth: CGFloat = 80
        static let deleteButtonWidth: CGFloat = 80
    }
}
