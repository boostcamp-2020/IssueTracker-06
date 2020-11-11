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
    //서치바 추가
    @IBOutlet private weak var searchBar: UISearchBar!
    private var selectedIndexPath: IndexPath?
    private var issues: Issues?
    // 서치바 필터 데이터 추가
    private var filterIssues: Issues = Issues()
    
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
        //서치바 추가
        searchBar.delegate = self
    }
    
    private func configureIssuesData() {
        IssueListDataManager().get(successHandler: { [weak self] in
            self?.issues = $0
            self?.configureIssueListCollectionView()
        })
    }

    private func configureIssueListCollectionView() {
        issueListCollectionView.delegate = self
        issueListCollectionView.dataSource = issueListCollectionViewDataSource
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

// 서치바
extension IssueListViewController: UISearchBarDelegate {
    // 서치바에 입력될때마다 호출되는 메소드
    // 이슈 데이터들 필터
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let issues = issues else { return }
        filterIssues.issues = searchText.isEmpty ? issues.issues : issues.issues.filter { return $0.title.contains(searchText) }
        issueListCollectionViewDataSource?.data = filterIssues
        issueListCollectionViewDataSource?.collectionView.reloadData()
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
