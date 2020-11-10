//
//  LabelAddViewController.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/10.
//

import UIKit

protocol AddLabelDelegate: class {
    func add(label: Label)
}

class LabelAddViewController: UIViewController {

    weak var addLabelDelegate: AddLabelDelegate?
    @IBOutlet private weak var addView: AddView!
    @IBOutlet private weak var addViewCenterYConstraint: NSLayoutConstraint!

    private let dataSource = LabelAddViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAddView()
    }
    
    private func configureAddView() {
        addView.delegate = self
        addView.dataSource = dataSource
    }
    
    private func save(label: Label) {
        LabelListDataManager().post(body: label, successHandler: { [weak self] _ in
            self?.addLabelDelegate?.add(label: label)
            self?.dismiss(animated: false, completion: nil)
        })
    }
}

extension LabelAddViewController: AddViewDelegate {
    
    func closeButtonTouched(_ addView: AddView) {
        dismiss(animated: false, completion: nil)
    }
    
    func saveButtonTouched(_ addView: AddView, inputTexts: [String : String]) {
        guard let label = LabelListDataManager.createLabel(labelDictionary: inputTexts)
        else {
            return
        }
        save(label: label)
    }
}
