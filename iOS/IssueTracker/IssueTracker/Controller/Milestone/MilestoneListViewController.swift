//
//  MilestoneListViewController.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/05.
//

import UIKit

protocol MilestoneListViewControllerDelegate {
    func milestone(_ milestone: Milestone)
    func snapshot(_ snapshot: UIView)
}

class MilestoneListViewController: UIViewController {

    @IBOutlet weak var milestoneCollectionView: UICollectionView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    private var selectedIndexPath: IndexPath?
    private var milestones: Milestones? {
        didSet {
            milestoneCollectionView.reloadData()
        }
    }
    private var milestoneIssuesMap = [Int: Issues]() {
        didSet {
            milestoneCollectionView.reloadData()
        }
    }
    
    private var selectedMilestone: Milestone? {
        guard let indexPath = selectedIndexPath else { return nil }
        return milestones?[indexPath.row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeNavigationBarUnderLine()
        configureRefreshControl()
        configureMilestonesData() { [weak self] in
            self?.configureMilestoneCollectionView()
        }
    }
    
    @IBSegueAction private func presentAddViewController(_ coder: NSCoder) -> MilestoneAddViewController? {
        let addViewController = MilestoneAddViewController(coder: coder)
        guard let viewController = addViewController else { return addViewController }
        configurePresentedViewController(viewController)
        return addViewController
    }
    
    @IBSegueAction private func presentUpdateViewController(_ coder: NSCoder) -> MilestoneAddViewController? {
        let updateViewController = MilestoneAddViewController(coder: coder)
        guard let viewController = updateViewController else { return updateViewController }
        configurePresentedViewController(viewController)
        return updateViewController
    }
}

// MARK: configure
private extension MilestoneListViewController {
    
    func removeNavigationBarUnderLine() {
        navigationBar.shadowImage = UIImage()
    }
    
    func configureRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshIssues), for: .valueChanged)
        milestoneCollectionView.refreshControl = refreshControl
    }
    
    @objc func refreshIssues(_ refresh: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            refresh.endRefreshing()
        })
        configureMilestonesData() {
            refresh.endRefreshing()
        }
    }
    
    func configureMilestonesData(completionHandler: (() -> Void)? = nil) {
        MilestoneDataManager().get(successHandler: { [weak self] in
            self?.milestones = $0
            guard let data = self?.milestones else { return }
            completionHandler?()
            
            data.milestones.forEach { [weak self] milestone in
                self?.configureIssuesData(milestoneName: milestone.name) { [weak self] issues in
                    self?.milestoneIssuesMap[milestone.id] = issues
                }
            }
        })
    }
    
    func configureMilestoneCollectionView() {
        milestoneCollectionView.delegate = self
        milestoneCollectionView.dataSource = self
        registerNib()
    }
    
    func registerNib() {
        let nib = UINib(nibName: Constant.milestoneListCollectionViewCell, bundle: nil)
        milestoneCollectionView.register(nib, forCellWithReuseIdentifier: Constant.milestoneListCell)
    }
    
    func configureIssuesData(milestoneName: String, completionHandler: ((Issues?) -> Void)? = nil) {
        MilestoneDataManager().getIssues(name: milestoneName, successHandler: {
            completionHandler?($0)
        })
    }
    
    func configurePresentedViewController(_ viewController: MilestoneAddViewController) {
        viewController.updateMilestoneDelegate = self
        guard let snapshot = UIApplication.snapshotView else { return }
        viewController.snapshot(snapshot)
        guard let milestone = selectedMilestone else { return }
        viewController.milestone(milestone)
        selectedIndexPath = nil
    }
}

extension MilestoneListViewController: UpdateMilestoneDelegate {
    
    func add(milestone: Milestone) {
        milestones?.add(milestone: milestone)
    }
    
    func update(milestone: Milestone) {
        milestones?.replace(milestone: milestone)
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
        static let labelMilestoneAddViewController: String = "LabelMilestoneAddViewController"
    }
    
    enum Metric {
        static let cellHeight: CGFloat = 100
    }
}
