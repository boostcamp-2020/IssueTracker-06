//
//  ContentInputView.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/09.
//

import UIKit

class ContentInputView: UIView {

    @IBOutlet private weak var propertyNameLabel: UILabel!
    
    init(propertyName: String) {
        super.init(frame: .zero)
        configureView(propertyName: propertyName)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView(propertyName: Constant.blank)
    }
}

// MARK: configure
private extension ContentInputView {
    
    func configureView(propertyName: String) {
        configureNib()
        configurePropertyNameLabel(propertyName: propertyName)
    }
    
    func configurePropertyNameLabel(propertyName: String) {
        propertyNameLabel.text = propertyName
    }
}

private extension ContentInputView {
    
    enum Constant {
        static let blank = ""
    }
}
