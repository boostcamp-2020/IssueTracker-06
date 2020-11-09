//
//  TextFieldInputView.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/09.
//

import UIKit

final class TextFieldInputView: ContentInputView {
    
    @IBOutlet private weak var inputTextField: UITextField!
    override var text: String {
        inputTextField.text ?? Constant.blank
    }
    
    init(propertyName: String, placeholder: String = Constant.blank) {
        super.init(propertyName: propertyName)
        inputTextField.placeholder = placeholder
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func reset() {
        super.reset()
        inputTextField.text = .none
    }
}

private extension TextFieldInputView {
    
    enum Constant {
        static let blank = ""
    }
}
