//
//  TextFieldInputView.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/09.
//

import UIKit

final class TextFieldInputView: ContentInputView {
    
    @IBOutlet weak var inputTextField: UITextField!
    
    init(propertyName: String, placeholder: String = Constant.blank) {
        super.init(propertyName: propertyName)
        inputTextField.placeholder = placeholder
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

private extension TextFieldInputView {
    
    enum Constant {
        static let blank = ""
    }
}
