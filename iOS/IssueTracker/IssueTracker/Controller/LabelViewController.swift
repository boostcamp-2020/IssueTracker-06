//
//  LabelViewController.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/05.
//

import UIKit

class LabelViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var labelCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeNavigationBarUnderLine()
        registerNib()
        configureLabelCollectionView()
    }
    
    private func removeNavigationBarUnderLine() {
        navigationBar.shadowImage = UIImage()
    }
    
    private func registerNib() {
        let nib = UINib(nibName: Constant.labelCollectionViewCell, bundle: nil)
        labelCollectionView.register(nib, forCellWithReuseIdentifier: Constant.labelCell)
    }
    
    private func configureLabelCollectionView() {
        labelCollectionView.delegate = self
        labelCollectionView.dataSource = self
    }
}

extension LabelViewController: UICollectionViewDelegate {}

extension LabelViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = labelCollectionView.dequeueReusableCell(
            withReuseIdentifier: Constant.labelCell,
            for: indexPath)
        
        guard let labelCell = cell as? LabelCollectionViewCell else { return cell }
        let label = Label(id: 1, name: "feature", color: "#ffffff", description: "어쩌구저쩌구")
        labelCell.configureCell(with: label)
        return cell
    }
}

extension LabelViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: 100)
    }
}

private extension LabelViewController {
    enum Constant {
        static let labelCell: String = "LabelCell"
        static let labelCollectionViewCell: String = "LabelCollectionViewCell"
    }
}
