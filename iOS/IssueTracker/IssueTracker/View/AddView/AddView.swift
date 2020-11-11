//
//  AddView.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/09.
//

import UIKit

protocol AddViewDelegate: class {
    func closeButtonTouched(_ addView: AddView)
    func saveButtonTouched(_ addView: AddView, inputTexts: [String: String])
}

protocol AddViewDataSource: class {
    func contentViews(_ addView: AddView) -> [ContentInputView]
}

final class AddView: UIView {

    @IBOutlet private weak var contentStackView: UIStackView!
    weak var delegate: AddViewDelegate?
    weak var dataSource: AddViewDataSource? {
        didSet {
            configureContentView()
        }
    }
    
    private var inputTexts: [String: String] {
        var inputTexts = [String: String]()
        dataSource?.contentViews(self).forEach {
            inputTexts[$0.propertyName] = $0.text
        }
        return inputTexts
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView() {
        guard let view = viewFromNib else { return }
        view.frame = bounds
        addSubview(view)
    }
    
    private func configureContentView() {
        dataSource?.contentViews(self).forEach {
            contentStackView.addArrangedSubview($0)
        }
    }
    
    @IBAction private func closeButtonTouched(_ sender: UIButton) {
        delegate?.closeButtonTouched(self)
    }
    
    @IBAction private func resetButtonTouched(_ sender: UIButton) {
        dataSource?.contentViews(self).forEach {
            $0.reset()
        }
    }
    
    @IBAction private func saveButtonTouched(_ sender: UIButton) {
        delegate?.saveButtonTouched(self, inputTexts: inputTexts)
    }
}
