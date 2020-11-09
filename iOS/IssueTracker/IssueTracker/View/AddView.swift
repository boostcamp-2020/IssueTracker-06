//
//  AddView.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/09.
//

import UIKit

protocol AddViewDelegate: class {
    func closeButtonTouched(_ addView: AddView)
    func resetButtonTouched(_ addView: AddView)
    func saveButtonTouched(_ addView: AddView)
}

protocol AddViewDataSource: class {
    func contentViews(_ addView: AddView) -> [ContentInputView]
}

final class AddView: UIView {

    @IBOutlet weak var contentStackView: UIStackView!
    weak var delegate: AddViewDelegate?
    weak var dataSource: AddViewDataSource? {
        didSet {
            configureContentView()
        }
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
    
    @IBAction func closeButtonTouched(_ sender: UIButton) {
        delegate?.closeButtonTouched(self)
    }
    
    @IBAction func resetButtonTouched(_ sender: UIButton) {
        delegate?.resetButtonTouched(self)
    }
    
    @IBAction func saveButtonTouched(_ sender: UIButton) {
        delegate?.saveButtonTouched(self)
    }
}
