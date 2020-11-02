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
    
    private lazy var issueListCollectionViewDataSource: IssueListCollectionViewDataSource = {
        IssueListCollectionViewDataSource(
            collectionView: issueListCollectionView,
            data: MockupData.data,
            scrollEnabled: false,
            checkboxEnabled: true)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureIssueListCollectionView()
    }
    
    private func configureIssueListCollectionView() {
        issueListCollectionView.delegate = self
        issueListCollectionView.dataSource = issueListCollectionViewDataSource
        issueListCollectionView.configureTapGesture(target: self, action: #selector(cellTouched(_:)))
    }
    
    @IBAction func selectAllButtonTouched(_ sender: UIBarButtonItem) {
        MockupData.data.enumerated().forEach {
            let indexPath = IndexPath(row: $0.offset, section: 0)
            guard let cell = issueListCollectionView.cellForItem(at: indexPath) as? IssueListCollectionViewCell
            else {
                return
            }
            cell.updateCheckboxState(isSelected: true)
        }
    }
    
    @IBAction private func cancelButtonTouched(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: false)
    }
    
    @objc private func cellTouched(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: issueListCollectionView)
        guard let indexPath = issueListCollectionView.indexPathForItem(at: point) else { return }
        guard let cell = issueListCollectionView.cellForItem(at: indexPath) as? IssueListCollectionViewCell
        else {
            return
        }
        cell.switchCheckboxState()
    }
}

extension IssueListEditViewController: UICollectionViewDelegate {
}

extension IssueListEditViewController: UICollectionViewDelegateFlowLayout {
    
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
