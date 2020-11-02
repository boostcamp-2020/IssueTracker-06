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
    
    private lazy var issueListCollectionViewDataSource: IssueListCollectionViewDataSource = {
        IssueListCollectionViewDataSource(
            collectionView: issueListCollectionView,
            data: MockupData.data)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupIssueListCollectionView()
        removeNavigationBarUnderLine()
    }
    
    private func setupIssueListCollectionView() {
        issueListCollectionView.delegate = self
        issueListCollectionView.dataSource = issueListCollectionViewDataSource
    }
    
    private func removeNavigationBarUnderLine() {
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}

extension IssueListViewController: UICollectionViewDelegate {}

extension IssueListViewController {
    
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
        static let issueDetailSegue: String = "IssueDetailSegue"
    }
    
    enum Metric {
        static let cellHeight: CGFloat = 100
    }
}
