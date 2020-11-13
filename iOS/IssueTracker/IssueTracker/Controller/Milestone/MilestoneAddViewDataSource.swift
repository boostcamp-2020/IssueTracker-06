//
//  MilestoneAddViewDataSource.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/10.
//

import Foundation

final class MilestoneAddViewDataSource: AddViewDataSource {
    
    private let titleInputView = TextFieldInputView(propertyName: Milestone.Key.title)
    private let completeDateInputView = TextFieldInputView(
        propertyName: Milestone.Key.completeDate,
        placeholder: "yyyy-mm-dd (선택)"
    )
    private let descriptionInputView = TextViewInputView(propertyName: Milestone.Key.description)
    
    private lazy var inputViews: [ContentInputView] = {
        [titleInputView, completeDateInputView, descriptionInputView]
    }()
    
    init(milestone: Milestone? = nil) {
        guard let milestone = milestone else { return }
        configureInputView(milestone: milestone)
    }
    
    func contentViews(_ addView: AddView) -> [ContentInputView] {
        inputViews
    }
    
    private func configureInputView(milestone: Milestone) {
        titleInputView.text = milestone.name
        completeDateInputView.text = milestone.date ?? Constant.blank
        descriptionInputView.text = milestone.description
    }
}

private extension MilestoneAddViewDataSource {
    
    enum Constant {
        static let blank = ""
    }
}
