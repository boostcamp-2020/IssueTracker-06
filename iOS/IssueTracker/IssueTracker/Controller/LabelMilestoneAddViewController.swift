//
//  LabelMilestoneAddViewController.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/09.
//

import UIKit

class LabelMilestoneAddViewController: UIViewController {

    weak var snapshotView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let snapshotView = snapshotView else {
            return
        }
        view.addSubview(snapshotView)
        snapshotViewLayout(snapshotView: snapshotView)
    }
    
    private func snapshotViewLayout(snapshotView: UIView) {
        view.backgroundColor = .gray
        snapshotView.translatesAutoresizingMaskIntoConstraints = false
        snapshotView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        snapshotView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        snapshotView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        snapshotView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        snapshotView.alpha = 0.5
    }

}
