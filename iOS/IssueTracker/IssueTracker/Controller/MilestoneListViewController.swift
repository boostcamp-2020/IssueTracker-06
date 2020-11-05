//
//  MilestoneListViewController.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/05.
//

import UIKit

class MilestoneListViewController: UIViewController {

    @IBOutlet weak var milestoneCollectionView: UICollectionView!
    private var milestones: Milestones?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        milestoneCollectionView.delegate = self
        milestoneCollectionView.dataSource = self
//        milestoneCollectionView.register(UINib(, forCellWithReuseIdentifier: <#T##String#>)
//        configureMilestonesData()
    }
    
    private func configureMilestonesData() {
        MilestoneDataProvider().get(successHandler: { [weak self] in
            self?.milestones = $0
            guard let data = self?.milestones else { return }
            print(data)
        })
    }

}

extension MilestoneListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }


}

extension MilestoneListViewController: UICollectionViewDelegate {

}
