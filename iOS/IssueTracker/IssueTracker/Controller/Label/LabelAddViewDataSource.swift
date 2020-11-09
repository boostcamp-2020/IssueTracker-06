//
//  LabelAddViewDataSource.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/10.
//

import Foundation

final class LabelAddViewDataSource: AddViewDataSource {
    
    private let addView = AddView()
    private let colorInputView = ColorInputView(propertyName: "색상")
    private let titleInputView = TextFieldInputView(propertyName: "제목")
    private let descriptionInputView = TextViewInputView(propertyName: "설명")
    
    private lazy var inputViews: [ContentInputView] = {
        [titleInputView, descriptionInputView, colorInputView]
    }()
    
    func contentViews(_ addView: AddView) -> [ContentInputView] {
        inputViews
    }
}
