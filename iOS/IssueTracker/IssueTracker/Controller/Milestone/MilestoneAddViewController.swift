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
        configureKeyboardEvent()
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

// 키보드 이벤트 처리
private extension MilestoneAddViewController {
    
    func configureKeyboardEvent() {
        configureKeyboardWillShowObserver()
        configureKeyboardWillHideObserver()
    }

    func configureKeyboardWillShowObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }

    func configureKeyboardWillHideObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame =
                notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        else {
            return
        }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        let differHeight = ((addView.frame.height / 2) + (keyboardHeight)) - (view.frame.height / 2)
        addViewCenterYConstraint.constant = -(differHeight + 10)
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        addViewCenterYConstraint.constant = 0
    }
}

// MARK: 키보드 관련 설정
extension MilestoneAddViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}