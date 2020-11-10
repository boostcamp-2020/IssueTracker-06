//
//  LabelAddViewController.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/10.
//

import UIKit

protocol UpdateLabelDelegate: class {
    func add(label: Label)
    func update(label: Label)
}

class LabelAddViewController: UIViewController {

    weak var updateLabelDelegate: UpdateLabelDelegate?
    @IBOutlet private weak var addView: AddView!
    @IBOutlet private weak var addViewCenterYConstraint: NSLayoutConstraint!
    private var label: Label?

    private lazy var dataSource: LabelAddViewDataSource = {
        LabelAddViewDataSource(label: label)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAddView()
    }
    
    private func configureAddView() {
        addView.delegate = self
        addView.dataSource = dataSource
    }
}

extension LabelAddViewController: AddViewDelegate {
    
    func closeButtonTouched(_ addView: AddView) {
        dismiss(animated: false, completion: nil)
    }
    
    func saveButtonTouched(_ addView: AddView, inputTexts: [String : String]) {
        guard let newLabel = LabelListDataManager.createLabel(label, labelDictionary: inputTexts)
        else {
            return
        }
        guard let _ = label else {
            save(label: newLabel)
            return
        }
        update(label: newLabel)
    }
    
    private func save(label: Label) {
        LabelListDataManager().post(body: label, successHandler: { [weak self] _ in
            self?.updateLabelDelegate?.add(label: label)
            self?.dismiss(animated: false, completion: nil)
        })
    }
    
    private func update(label: Label) {
        LabelListDataManager().put(body: label, successHandler: { [weak self] _ in
            self?.updateLabelDelegate?.update(label: label)
            self?.dismiss(animated: false, completion: nil)
        })
    }
}

extension LabelAddViewController: LabelViewControllerDelegate {
    
    func label(_ label: Label) {
        self.label = label
    }
}
