//
//  LabelAddViewController.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/09.
//

import UIKit

protocol AddMilestoneDelegate: class {
    func add(milestone: Milestone)
}

final class MilestoneAddViewController: UIViewController {

    @IBOutlet private weak var addView: AddView!
    @IBOutlet private weak var addViewCenterYConstraint: NSLayoutConstraint!
    private let dataSource = MilestoneAddViewDataSource()
    weak var addMilestoneDelegate: AddMilestoneDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAddView()
    }
    
    private func configureAddView() {
        addView.delegate = self
        addView.dataSource = dataSource
    }
}

extension MilestoneAddViewController: AddViewDelegate {
    
    func closeButtonTouched(_ addView: AddView) {
        dismiss(animated: false, completion: nil)
    }
    
    func saveButtonTouched(_ addView: AddView, inputTexts: [String : String]) {
        guard let milestone = MilestoneDataManager.createMilestone(milestoneDictionary: inputTexts)
        else {
            return
        }
        save(milestone: milestone)
    }
    
    private func save(milestone: Milestone) {
        MilestoneDataManager().post(body: milestone, successHandler: { [weak self] _ in
            self?.addMilestoneDelegate?.add(milestone: milestone)
            self?.dismiss(animated: false, completion: nil)
        })
    }
}
