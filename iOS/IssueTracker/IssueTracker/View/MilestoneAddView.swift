//
//  MilestoneAddView.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/09.
//

import UIKit

final class MilestoneAddView: UIView {
    
    private let addView = AddView()
    private let titleInputView = TextFieldInputView(propertyName: "제목")
    private let completeDateInputView = TextFieldInputView(
        propertyName: "완료 날짜",
        placeholder: "yyyy-mm-dd (선택)"
    )
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

extension MilestoneAddView: AddViewDataSource {
    
    func contentViews(_ addView: AddView) -> [ContentInputView] {
        return [titleInputView, completeDateInputView, descriptionInputView]
    }
}
