//
//  ContentInputView.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/09.
//

import UIKit

class ContentInputView: UIView {

    let propertyName: String
    @IBOutlet weak var propertyNameLabel: UILabel!
    
    init(propertyName: String) {
        self.propertyName = propertyName
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        propertyName = Constant.blank
        super.init(coder: coder)
        configureView()
    }
}

// MARK: configure
private extension ContentInputView {
    
    func configureView() {
        configureNib()
        configurePropertyNameLabel()
    }
    
    func configurePropertyNameLabel() {
        propertyNameLabel.text = propertyName
    }
}

private extension ContentInputView {
    
    enum Constant {
        static let blank = ""
    }
}
