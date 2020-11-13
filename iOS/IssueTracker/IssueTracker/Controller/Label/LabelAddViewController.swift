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
    @IBOutlet weak var backgroundView: UIView!
    private var label: Label?
    private var snapshotView: UIView?

    private lazy var dataSource: LabelAddViewDataSource = {
        LabelAddViewDataSource(label: label)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAddView()
        configureBackgroundView()
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
    
    func snapshot(_ snapshot: UIView) {
        snapshotView = snapshot
    }

    func label(_ label: Label) {
        self.label = label
    }
}

// 키보드 이벤트 처리
private extension LabelAddViewController {
    
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
extension LabelAddViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}