//
//  ViewController.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/10/27.
//

import UIKit

class IssueListViewController: UIViewController {

    @IBOutlet weak var issueListCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        issueListCollectionView.delegate = self
        issueListCollectionView.dataSource = self
    }
}

extension IssueListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MockupData.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = issueListCollectionView.dequeueReusableCell(withReuseIdentifier: "IssueListCell", for: indexPath)
        
        let issueListCollectionViewCell = cell as? IssueListCollectionViewCell
        issueListCollectionViewCell?.setWidth(issueListCollectionView.bounds.width + 200)
        let issue = MockupData.data[indexPath.row]
        issueListCollectionViewCell?.setIssue(issue)
        return cell
    }
}

extension IssueListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: issueListCollectionView.bounds.width, height: 100)
    }
}
