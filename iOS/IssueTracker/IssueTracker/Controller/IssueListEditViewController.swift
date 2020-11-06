//
//  IssueListEditViewController.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/02.
//

import UIKit

final class IssueListEditViewController: UIViewController {

    @IBOutlet weak var issueListCollectionView: UICollectionView!
    @IBOutlet weak var selectCountLabel: UILabel!
    private var issues: Issues?
    private var selectedIssues = Issues()
    
    private lazy var issueListCollectionViewDataSource: IssueListCollectionViewDataSource? = {
        guard let issues = issues else { return nil }
        return IssueListCollectionViewDataSource(
            collectionView: issueListCollectionView,
            data: issues,
            scrollEnabled: false,
            checkboxEnabled: true)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureIssuesData()
    }
    
    private func configureIssuesData() {
        IssueListDataProvider().get(successHandler: { [weak self] in
            guard let issue = $0 else { return }
            self?.issues = issue
            self?.configureIssueListCollectionView()
        })
    }

    private func configureIssueListCollectionView() {
        issueListCollectionView.delegate = self
        issueListCollectionView.dataSource = issueListCollectionViewDataSource
        issueListCollectionView.configureTapGesture(target: self, action: #selector(cellTouched(_:)))
    }
    
    private func switchIssueSelected(issue: Issue) {
        if selectedIssues.contains(issue: issue) {
            selectedIssues.remove(issue: issue)
            return
        }
        selectedIssues.add(issue: issue)
    }

    @IBAction func selectAllButtonTouched(_ sender: UIBarButtonItem) {
        guard let issues = issues else { return }
        selectedIssues = issues
        selectCountLabel.text = selectedIssues.count.selectedCountText
        issueListCollectionView.reloadData()
    }

    @IBAction private func cancelButtonTouched(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: false)
    }

    @objc private func cellTouched(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: issueListCollectionView)
        guard let indexPath = issueListCollectionView.indexPathForItem(at: point),
              let issue = issues?[indexPath.row]
        else { return }
        switchIssueSelected(issue: issue)
        selectCountLabel.text = selectedIssues.count.selectedCountText
        issueListCollectionView.reloadData()
    }
}

extension IssueListEditViewController: UICollectionViewDelegate {
}

extension IssueListEditViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath) {
        guard let cell = cell as? IssueListCollectionViewCell,
              let issue = issues?[indexPath.row] else { return }
        if selectedIssues.contains(issue: issue) {
            cell.updateCheckboxState(isSelected: true)
            return
        }
        cell.updateCheckboxState(isSelected: false)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: issueListCollectionView.bounds.width, height: Metric.cellHeight)
    }
}

private extension IssueListEditViewController {
    
    enum Metric {
        static let cellHeight: CGFloat = 100
    }
}

private extension Int {
    
    var selectedCountText: String {
        "\(self)개 선택"
    }
}
