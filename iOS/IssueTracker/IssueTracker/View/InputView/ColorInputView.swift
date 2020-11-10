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
    
    override init(propertyName: String) {
        super.init(propertyName: propertyName)
        configureColorTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureColorTextField()
    }
    
    override func reset() {
        super.reset()
        colorTextField.text = .none
        colorView.backgroundColor = .white
    }

    @IBAction private func randomColorButtonTouched(_ sender: UIButton) {
        let randomColor = UIColor.randomColor
        colorView.backgroundColor = randomColor
        colorTextField.text = randomColor.toHexString
    }
}

// MARK: configure
private extension ColorInputView {
    
    private func configureColorTextField() {
        colorTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        colorView.backgroundColor = textField.text?.color
    }
}

private extension ColorInputView {
    
    enum Constant {
        static let blank = ""
    }
}
