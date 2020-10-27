//
//  LabelsStackView.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/10/27.
//

import UIKit

class LabelsStackView: UIStackView {
    
    func add(label: LabelView) {
        addArrangedSubview(label)
    }
    
    func clear() {
        arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
}
