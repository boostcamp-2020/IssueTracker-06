//
//  LabelAddView.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/09.
//

import UIKit

final class LabelAddView: UIView {

    private let addView = AddView()
    private let colorInputView = ColorInputView(propertyName: "색상")
    private let titleInputView = TextFieldInputView(propertyName: "제목")
    private let descriptionInputView = TextViewInputView(propertyName: "설명")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView() {
        addView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(addView)
        addView.setConstraintToFit(at: self)
        addView.dataSource = self
    }
}

extension LabelAddView: AddViewDataSource {
    
    func contentViews(_ addView: AddView) -> [ContentInputView] {
        return [titleInputView, descriptionInputView, colorInputView]
    }
}
