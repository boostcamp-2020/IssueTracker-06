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
        milestoneCollectionView.register(UINib(nibName: "MilestoneListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MilestoneListCell")
        configureMilestonesData()
    }
    
    private func configureMilestonesData() {
        MilestoneDataProvider().get(successHandler: { [weak self] in
            self?.milestones = $0
            guard let data = self?.milestones else { return }
            print(data)
            self?.milestoneCollectionView.reloadData()
        })
    }

}

extension MilestoneListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let milestones = self.milestones else {
            return 0
        }
        return milestones.milestones.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = milestoneCollectionView.dequeueReusableCell(
            withReuseIdentifier: "MilestoneListCell",
            for: indexPath)
        if let milestoneCell = cell as? MilestoneListCollectionViewCell,
           let milestone = milestones?.milestones[indexPath.row] {
            milestoneCell.setMilestone(milestone: milestone)
        }
        
        return cell
    }


}

extension MilestoneListViewController: UICollectionViewDelegate {
    
}

extension MilestoneListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.bounds.width
        let height = CGFloat(100)
        return CGSize(width: width, height: height)
    }
}
