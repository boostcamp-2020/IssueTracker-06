//
//  ColorInputView.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/09.
//

import UIKit

final class ColorInputView: ContentInputView {

    @IBOutlet private weak var colorTextField: UITextField!
    @IBOutlet private weak var colorView: UIView!
    override var text: String {
        colorTextField.text ?? Constant.blank
    }
    
    override func reset() {
        super.reset()
        colorTextField.text = .none
        colorView.backgroundColor = .white
    }
    
    @IBAction private func randomColorButtonTouched(_ sender: UIButton) {
        
    }
}

extension ColorInputView {
    
    enum Constant {
        static let blank = ""
    }
}
