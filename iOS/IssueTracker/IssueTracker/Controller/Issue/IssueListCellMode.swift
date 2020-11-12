//
//  IssueListCellMode.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/11.
//

import Foundation

enum IssueListCellMode {
    case edit
    case normal
    
    var enabled: (isCheckboxEnabled: Bool, isScrollEnabled: Bool) {
        switch self {
        case .edit:
            return (isCheckboxEnabled: true, isScrollEnabled: false)
        case .normal:
            return (isCheckboxEnabled: false, isScrollEnabled: true)
        }
    }
    
    var switchMode: IssueListCellMode {
        switch self {
        case .edit:
            return .normal
        case .normal:
            return .edit
        }
    }
    
    var isEditMode: Bool {
        switch self {
        case .edit:
            return true
        case .normal:
            return false
        }
    }
}