//
//  ViewController.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/10/27.
//

import UIKit

protocol IssueListViewControllerDelegate: class {
    func issueId(_ id: Int)
}

final class IssueListViewController: UIViewController {

    @IBOutlet private weak var issueListCollectionView: UICollectionView!
    private var selectedIndexPath: IndexPath?
    private var issues: Issues?
    
    private lazy var issueListCollectionViewDataSource: IssueListCollectionViewDataSource? = {
        guard let issues = issues else { return nil }
        return IssueListCollectionViewDataSource(
            collectionView: issueListCollectionView,
            data: issues)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureIssuesData()
        removeNavigationBarUnderLine()
    }
    
    private func configureIssuesData() {
        IssueListDataProvider().get(successHandler: { [weak self] in
            self?.issues = $0
            self?.configureIssueListCollectionView()
        })
    }

    private func configureIssueListCollectionView() {
        guard let dataSource = issueListCollectionViewDataSource else { return }
        issueListCollectionView.delegate = self
        issueListCollectionView.dataSource = dataSource
        issueListCollectionView.configureTapGesture(target: self, action: #selector(cellTouched(_:)))
    }

    private func removeNavigationBarUnderLine() {
        navigationController?.navigationBar.shadowImage = UIImage()
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
              let issueId = issues?[selectedIndexPath.row]?.id
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
