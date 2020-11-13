//
//  AssigneeStackView.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/10/29.
//

import UIKit

final class AssigneeStackView: UIStackView {
    
    func add(assigneeView: AssigneeView) {
        addArrangedSubview(assigneeView)
    }
    
    func clear() {
        arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
}
