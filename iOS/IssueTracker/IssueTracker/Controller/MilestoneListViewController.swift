//
//  MilestoneListViewController.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/05.
//

import UIKit

class MilestoneListViewController: UIViewController {

    @IBOutlet weak var milestoneCollectionView: UICollectionView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    private var milestones: Milestones?
    private var milestoneIssuesMap = [Milestone:Issues]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeNavigationBarUnderLine()
        configureMilestonesData()
    }
    
    private func removeNavigationBarUnderLine() {
        navigationBar.shadowImage = UIImage()
    }
    
    private func configureMilestonesData() {
        MilestoneDataProvider().get(successHandler: { [weak self] in
            self?.milestones = $0
            guard let data = self?.milestones else { return }
            self?.configureMilestoneCollectionView()
            
            data.milestones.forEach { [weak self] milestone in
                self?.configureIssuesData(milestoneName: milestone.name) { [weak self] issues in
                    self?.milestoneIssuesMap[milestone] = issues
                    self?.milestoneCollectionView.reloadData()
                }
            }
        })
    }
    
    private func configureMilestoneCollectionView() {
        milestoneCollectionView.delegate = self
        milestoneCollectionView.dataSource = self
        registerNib()
    }
    
    private func registerNib() {
        let nib = UINib(nibName: Constant.milestoneListCollectionViewCell, bundle: nil)
        milestoneCollectionView.register(nib, forCellWithReuseIdentifier: Constant.milestoneListCell)
    }
    
    private func configureIssuesData(milestoneName: String, completionHandler: ((Issues?) -> Void)? = nil) {
        let processedName = milestoneName.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        MilestoneDataProvider().getIssues(name: processedName, successHandler: {
            completionHandler?($0)
        })
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

extension MilestoneListViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        milestones?.milestones.count ?? 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = milestoneCollectionView.dequeueReusableCell(
            withReuseIdentifier: Constant.milestoneListCell,
            for: indexPath)
        guard let milestoneCell = cell as? MilestoneListCollectionViewCell,
              let milestone = milestones?.milestones[indexPath.row]
        else {
            return cell
        }
        milestoneCell.configure(with: milestone)
        let issues = milestoneIssuesMap[milestone]
        milestoneCell.configure(with: issues)
        return cell
    }
}

extension MilestoneListViewController: UICollectionViewDelegate {}

extension MilestoneListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width
        let height = CGFloat(Metric.cellHeight)
        return CGSize(width: width, height: height)
    }
}

private extension MilestoneListViewController {
    
    enum Constant {
        static let milestoneListCell: String = "MilestoneListCell"
        static let milestoneListCollectionViewCell: String = "MilestoneListCollectionViewCell"
        static let labelMilestoneAddViewController: String = "LabelMilestoneAddViewController"
    }
    
    enum Metric {
        static let cellHeight: CGFloat = 100
    }
}
