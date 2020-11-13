//
//  LabelAddViewController.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/09.
//

import UIKit

protocol UpdateMilestoneDelegate: class {
    func add(milestone: Milestone)
    func update(milestone: Milestone)
}

final class MilestoneAddViewController: UIViewController {

    weak var updateMilestoneDelegate: UpdateMilestoneDelegate?
    @IBOutlet private weak var addView: AddView!
    @IBOutlet private weak var addViewCenterYConstraint: NSLayoutConstraint!
    
    @IBOutlet private weak var backgroundView: UIView!
    private var milestone: Milestone?
    private var snapshotView: UIView?
    
    private lazy var dataSource: MilestoneAddViewDataSource = {
        MilestoneAddViewDataSource(milestone: milestone)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundView()
        configureAddView()
        view.configureTapGesture(target: self, action: #selector(handleTapGesture(recognizer:)))
    }
    
    private func configureAddView() {
        addView.delegate = self
        addView.dataSource = dataSource
    }
    
    private func configureBackgroundView() {
        guard let snapshotView = snapshotView else {
            return
        }
        snapshotView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(snapshotView)
        snapshotView.setConstraintToFit(at: backgroundView)
    }
    
    @objc private func handleTapGesture(recognizer: UITapGestureRecognizer) {
        self.dismiss(animated: false, completion: nil)
    }
}

extension MilestoneAddViewController: AddViewDelegate {
    
    func closeButtonTouched(_ addView: AddView) {
        dismiss(animated: false, completion: nil)
    }
    
    func saveButtonTouched(_ addView: AddView, inputTexts: [String : String]) {
        guard let newMilestone = MilestoneDataManager.createMilestone(
                milestone,
                milestoneDictionary: inputTexts)
        else {
            return
        }
        guard let _ = milestone else {
            save(milestone: newMilestone)
            return
        }
        update(milestone: newMilestone)
    }
    
    private func save(milestone: Milestone) {
        MilestoneDataManager().post(body: milestone, successHandler: { [weak self] _ in
            self?.updateMilestoneDelegate?.add(milestone: milestone)
            self?.dismiss(animated: false, completion: nil)
        })
    }
    
    private func update(milestone: Milestone) {
        MilestoneDataManager().put(body: milestone, successHandler: { [weak self] _ in
            self?.updateMilestoneDelegate?.update(milestone: milestone)
            self?.dismiss(animated: false, completion: nil)
        })
    }
}

extension MilestoneAddViewController: MilestoneListViewControllerDelegate {
    
    func milestone(_ milestone: Milestone) {
        self.milestone = milestone
    }
    
    func snapshot(_ snapshot: UIView) {
        snapshotView = snapshot
    }
}
