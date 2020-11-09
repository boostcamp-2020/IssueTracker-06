//
//  LabelAddViewController.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/10.
//

import UIKit

class LabelAddViewController: UIViewController {

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
        dismiss(animated: false, completion: nil)
    }
}

extension LabelAddViewController: AddViewDelegate {
    
    func closeButtonTouched(_ addView: AddView) {
        dismiss(animated: false, completion: nil)
    }
    
    func saveButtonTouched(_ addView: AddView, inputTexts: [String : String]) {
        guard let label = LabelListDataProvider.createLabel(labelDictionary: inputTexts)
        else {
            return
        }
        save(label: label)
    }
}
