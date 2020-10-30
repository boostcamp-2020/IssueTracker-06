//
//  ViewController.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/10/27.
//

import UIKit

protocol IssueListViewControllerDelegate: class {
    func issueId(_ id: String)
}

final class IssueListViewController: UIViewController {

    @IBOutlet private weak var issueListCollectionView: UICollectionView!

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
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}

extension IssueListViewController: UICollectionViewDelegate {}

extension IssueListViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return MockupData.data.count
    }
    
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
        setCellTouchEvent(at: cell, selector: #selector(scrollViewTapTest))
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
    
    private func setCellTouchEvent(at view: UIView, selector touchEventHandler: Selector? = nil) {
        let scrollViewTapGestureRecognizer =
            UITapGestureRecognizer(target: self, action: touchEventHandler)
        scrollViewTapGestureRecognizer.numberOfTouchesRequired = 1
        scrollViewTapGestureRecognizer.isEnabled = true
        scrollViewTapGestureRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(scrollViewTapGestureRecognizer)
    }
    
    @objc private func scrollViewTapTest() {
        performSegue(withIdentifier: Constant.issueDetailSegue, sender: nil)
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
        static let issueDetailSegue: String = "IssueDetailSegue"
    }
    
    enum Metric {
        static let cellHeight: CGFloat = 100
        static let closeButtonWidth: CGFloat = 80
        static let deleteButtonWidth: CGFloat = 80
    }
}
