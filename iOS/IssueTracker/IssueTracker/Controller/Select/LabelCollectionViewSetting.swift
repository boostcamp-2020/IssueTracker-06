//
//  LabelCollectionViewSetting.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/12.
//

import UIKit

class LabelCollectionViewSetting: NSObject {
    
    private let collectionView: UICollectionView
    private var labels: Labels?
    private var selectedLabels = Labels() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    func update(labels: Labels) {
        self.labels = labels
    }
}

extension LabelCollectionViewSetting: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        labels?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constant.selectCell,
            for: indexPath)
        guard let selectCell = cell as? SelectCollectionViewCell,
              let labels = labels,
              let label = labels[indexPath.row]
        else {
            return cell
        }
        selectCell.configureCell(with: label)
        return cell
    }
}

extension LabelCollectionViewSetting: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let label = labels?[indexPath.row] else { return }
        switchIsSelected(label: label)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath) {
        
        guard let cell = cell as? SelectCollectionViewCell,
              let label = labels?[indexPath.row]
        else {
            return
        }
        let isSelected = selectedLabels.contains(label: label)
        cell.updateCheckState(isSelected: isSelected)
    }
    
    private func switchIsSelected(label: Label) {
        if selectedLabels.contains(label: label) {
            selectedLabels.remove(label: label)
            return
        }
        selectedLabels.add(label: label)
    }
}

private extension LabelCollectionViewSetting {
    
    enum Constant {
        static let selectCell: String = "SelectCell"
    }
}
