//
//  MilestoneCollectionViewSetting.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/12.
//

import UIKit

class MilestoneCollectionViewSetting: NSObject {
    
    private let collectionView: UICollectionView
    private var milestones: Milestones? {
        didSet {
            collectionView.reloadData()
        }
    }
    private var selectedIndexPath: IndexPath? {
        didSet {
            collectionView.reloadData()
        }
    }

    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    func update(milestones: Milestones) {
        self.milestones = milestones
    }
}

extension MilestoneCollectionViewSetting: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        milestones?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constant.selectCell,
            for: indexPath)
        
        guard let selectCell = cell as? SelectCollectionViewCell,
              let milestones = milestones,
              let milestone = milestones[indexPath.row]
        else {
            return cell
        }
        selectCell.configureCell(with: milestone)
        return cell
    }
}

extension MilestoneCollectionViewSetting: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath) {
        
        guard let cell = cell as? SelectCollectionViewCell else { return }
        let isSelected = indexPath == selectedIndexPath
        cell.updateCheckState(isSelected: isSelected)
    }
}

private extension MilestoneCollectionViewSetting {
    
    enum Constant {
        static let selectCell: String = "SelectCell"
    }
}
