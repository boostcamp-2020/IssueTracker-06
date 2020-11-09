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
    
    func contentViews(_ addView: AddView) -> [ContentInputView] {
        inputViews
    }
}
