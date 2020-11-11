//
//  ContentView.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/09.
//

import UIKit

final class TextViewInputView: ContentInputView {
    
    @IBOutlet private weak var inputTextView: UITextView!
    override var text: String {
        get {
            inputTextView.text
        }
        set {
            inputTextView.text = newValue
        }
    }
    
    override init(propertyName: String) {
        super.init(propertyName: propertyName)
        configureTextView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureTextView()
    }
    
    override func reset() {
        super.reset()
        inputTextView.text = .none
    }
}

// MARK: configure
private extension TextViewInputView {
    
    func configureTextView() {
        inputTextView.textContainerInset = .zero
        inputTextView.textContainer.lineFragmentPadding = 0
    }
}

private extension TextViewInputView {
    
    enum Constant {
        static let blank = ""
    }
}
