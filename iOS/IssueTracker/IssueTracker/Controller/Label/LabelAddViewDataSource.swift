//
//  LabelAddViewDataSource.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/10.
//

import Foundation

final class LabelAddViewDataSource: AddViewDataSource {
    
    private let addView = AddView()
    private let colorInputView = ColorInputView(propertyName: Label.Key.color)
    private let titleInputView = TextFieldInputView(propertyName: Label.Key.title)
    private let descriptionInputView = TextViewInputView(propertyName: Label.Key.description)
    
    private lazy var inputViews: [ContentInputView] = {
        [titleInputView, descriptionInputView, colorInputView]
    }()
    
    func contentViews(_ addView: AddView) -> [ContentInputView] {
        inputViews
    }
}
