//
//  IssueListEditViewController.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/02.
//

import UIKit

class IssueListEditViewController: UIViewController {

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
        issueListCollectionView.delegate = self
        issueListCollectionView.dataSource = issueListCollectionViewDataSource
    }
    
    @IBAction private func cancelButtonTouched(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
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
