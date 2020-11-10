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
    private var labels: Labels?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeNavigationBarUnderLine()
        configureLabelListData() { [weak self] in
            self?.configureLabelCollectionView()
        }
    }
    
    private func configureLabelListData(completionHandler: (() -> Void)? = nil) {
        LabelListDataManager().get(successHandler: { [weak self] in
            self?.labels = $0
            completionHandler?()
        })
    }
    
    private func removeNavigationBarUnderLine() {
        navigationBar.shadowImage = UIImage()
    }
    
    private func registerNib() {
        let nib = UINib(nibName: Constant.labelCollectionViewCell, bundle: nil)
        labelCollectionView.register(nib, forCellWithReuseIdentifier: Constant.labelCell)
    }
    
    private func configureLabelCollectionView() {
        registerNib()
        labelCollectionView.delegate = self
        labelCollectionView.dataSource = self
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        guard let labelMilestoneAddVC = self.storyboard?.instantiateViewController(
                withIdentifier: Constant.labelMilestoneAddViewController)
                as? LabelMilestoneAddViewController else { return }
        labelMilestoneAddVC.modalPresentationStyle = .fullScreen
        
        guard let snap = UIApplication.shared.keyWindow!.snapshotView(
                afterScreenUpdates: true
        ) else { return }
        
        labelMilestoneAddVC.snapshotView = snap
        present(labelMilestoneAddVC, animated: false, completion: nil)
    }
}

extension LabelViewController: UICollectionViewDelegate {}

extension LabelViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        labels?.count ?? 0
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = labelCollectionView.dequeueReusableCell(
            withReuseIdentifier: Constant.labelCell,
            for: indexPath)
        
        guard let labelCell = cell as? LabelCollectionViewCell,
              let labels = labels,
              let label = labels[indexPath.row]
        else {
            return cell
        }
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
        static let labelMilestoneAddViewController: String = "LabelMilestoneAddViewController"
    }
}

extension UIView {
   func snapshotImage() -> UIImage? {
       UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0)
       drawHierarchy(in: bounds, afterScreenUpdates: false)
       let image = UIGraphicsGetImageFromCurrentImageContext()
       UIGraphicsEndImageContext()
       return image
   }
}
