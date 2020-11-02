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
    private var selectedIndexPath: IndexPath?
    
    private lazy var issueListCollectionViewDataSource: IssueListCollectionViewDataSource = {
        IssueListCollectionViewDataSource(
            collectionView: issueListCollectionView,
            data: MockupData.data)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureIssueListCollectionView()
        removeNavigationBarUnderLine()
        configureTapGesture(at: issueListCollectionView, action: #selector(cellTouched(_:)))
    }
    
    private func configureIssueListCollectionView() {
        issueListCollectionView.delegate = self
        issueListCollectionView.dataSource = issueListCollectionViewDataSource
    }
    
    private func removeNavigationBarUnderLine() {
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func configureTapGesture(at view: UIView, action: Selector? = nil) {
        let scrollViewTapGestureRecognizer =
            UITapGestureRecognizer(target: self, action: action)
        scrollViewTapGestureRecognizer.numberOfTouchesRequired = 1
        scrollViewTapGestureRecognizer.isEnabled = true
        scrollViewTapGestureRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(scrollViewTapGestureRecognizer)
    }

    @objc private func cellTouched(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: issueListCollectionView)
        guard let indexPath = issueListCollectionView.indexPathForItem(at: point) else { return }
        selectedIndexPath = indexPath
        moveToIssueDetailViewController()
    }
    
    private func moveToIssueDetailViewController() {
        performSegue(withIdentifier: Constant.issueDetailSegue, sender: nil)
    }
    
    @IBSegueAction func presentIssueDeatilViewController(_ coder: NSCoder) -> IssueDetailViewController? {
        let issueDetailViewController = IssueDetailViewController(coder: coder)
        guard let selectedIndexPath = selectedIndexPath,
              let issueId = MockupData.data[safe: selectedIndexPath.row]?.id
        else {
            return issueDetailViewController
        }
        issueDetailViewController?.issueId(issueId)
        return issueDetailViewController
    }
}

extension IssueListViewController: UICollectionViewDelegate {}

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
