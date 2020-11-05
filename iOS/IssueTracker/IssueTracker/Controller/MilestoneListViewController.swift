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
    private var milestoneIssuesMap = [Milestone:Issues]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMilestonesData()
    }
    
    private func configureMilestonesData() {
        MilestoneDataProvider().get(successHandler: { [weak self] in
            self?.milestones = $0
            guard let data = self?.milestones else { return }
            self?.configureMilestoneCollectionView()
            
            var requestCount = 0
            data.milestones.forEach { [weak self] milestone in
                self?.configureIssuesData(milestoneName: milestone.name) { [weak self] issues in
                    self?.milestoneIssuesMap[milestone] = issues
                    requestCount += 1
                    self?.milestoneCollectionView.reloadData()
                    if requestCount == data.milestones.count {
                        
                    }
                }
            }
        })
    }
    
    private func configureMilestoneCollectionView() {
        milestoneCollectionView.delegate = self
        milestoneCollectionView.dataSource = self
        milestoneCollectionView.register(UINib(nibName: "MilestoneListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MilestoneListCell")
    }
    
    private func configureIssuesData(milestoneName: String, completionHandler: ((Issues?) -> Void)? = nil) {
        let name = "change test"
        let processedName = milestoneName.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        MilestoneDataProvider().getIssues(name: processedName, successHandler: {
            completionHandler?($0)
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
        guard let milestoneCell = cell as? MilestoneListCollectionViewCell,
              let milestone = milestones?.milestones[indexPath.row]
        else {
            return cell
        }
        milestoneCell.setMilestone(milestone: milestone)
        let issues = milestoneIssuesMap[milestone]
        milestoneCell.configure(with: issues)
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
