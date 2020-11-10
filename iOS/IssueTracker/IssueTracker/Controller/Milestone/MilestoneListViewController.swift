//
//  MilestoneListViewController.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/05.
//

import UIKit

protocol MilestoneListViewControllerDelegate {
    func milestone(_ milestone: Milestone)
}

class MilestoneListViewController: UIViewController {

    @IBOutlet weak var milestoneCollectionView: UICollectionView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    private var milestones: Milestones?
    private var selectedIndexPath: IndexPath?
    private var milestoneIssuesMap = [Int: Issues]()
    
    private var selectedMilestone: Milestone? {
        guard let indexPath = selectedIndexPath else { return nil }
        return milestones?[indexPath.row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeNavigationBarUnderLine()
        configureMilestonesData()
    }
    
    private func removeNavigationBarUnderLine() {
        navigationBar.shadowImage = UIImage()
    }
    
    private func configureMilestonesData() {
        MilestoneDataManager().get(successHandler: { [weak self] in
            self?.milestones = $0
            guard let data = self?.milestones else { return }
            self?.configureMilestoneCollectionView()
            
            data.milestones.forEach { [weak self] milestone in
                self?.configureIssuesData(milestoneName: milestone.name) { [weak self] issues in
                    self?.milestoneIssuesMap[milestone.id] = issues
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
        MilestoneDataManager().getIssues(name: processedName, successHandler: {
            completionHandler?($0)
        })
    }
    
    @IBSegueAction private func presentAddViewController(_ coder: NSCoder) -> MilestoneAddViewController? {
        let addViewController = MilestoneAddViewController(coder: coder)
        addViewController?.updateMilestoneDelegate = self
        return addViewController
    }
    
    @IBSegueAction private func presentUpdateViewController(_ coder: NSCoder) -> MilestoneAddViewController? {
        let updateViewController = MilestoneAddViewController(coder: coder)
        updateViewController?.updateMilestoneDelegate = self

        guard let milestone = selectedMilestone else { return updateViewController }
        updateViewController?.milestone(milestone)
        return updateViewController
    }
}

extension MilestoneListViewController: UpdateMilestoneDelegate {
    
    func add(milestone: Milestone) {
        milestones?.add(milestone: milestone)
        milestoneCollectionView.reloadData()
    }
    
    func update(milestone: Milestone) {
        milestones?.replace(milestone: milestone)
        milestoneCollectionView.reloadData()
    }
}

extension MilestoneListViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        milestones?.count ?? 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = milestoneCollectionView.dequeueReusableCell(
            withReuseIdentifier: Constant.milestoneListCell,
            for: indexPath)
        guard let milestoneCell = cell as? MilestoneListCollectionViewCell,
              let milestone = milestones?[indexPath.row]
        else {
            return cell
        }
        milestoneCell.configure(with: milestone)
        let issues = milestoneIssuesMap[milestone.id]
        milestoneCell.configure(with: issues)
        return cell
    }
}

extension MilestoneListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        performSegue(withIdentifier: Constant.updateSegue, sender: nil)
    }
}

extension MilestoneListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width
        let height = CGFloat(Metric.cellHeight)
        return CGSize(width: width, height: height)
    }
}

private extension MilestoneListViewController {
    
    enum Constant {
        static let updateSegue: String = "UpdateSegue"
        static let milestoneListCell: String = "MilestoneListCell"
        static let milestoneListCollectionViewCell: String = "MilestoneListCollectionViewCell"
    }
    
    enum Metric {
        static let cellHeight: CGFloat = 100
    }
}
