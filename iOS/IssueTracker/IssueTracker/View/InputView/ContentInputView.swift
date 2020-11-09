//
//  ContentInputView.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/09.
//

import UIKit

protocol Inputable {
    var propertyName: String { get }
    var text: String { get }
    func reset()
}

class ContentInputView: UIView, Inputable {
    
    private(set) var text: String = Constant.blank
    let propertyName: String
    
    func reset() {}
    
    @IBOutlet private weak var propertyNameLabel: UILabel!
    
    init(propertyName: String) {
        self.propertyName = propertyName
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        self.propertyName = Constant.blank
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
