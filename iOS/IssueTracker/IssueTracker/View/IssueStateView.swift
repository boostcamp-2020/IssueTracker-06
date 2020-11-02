//
//  IssueStateView.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/10/28.
//

import UIKit

final class IssueStateView: UIView {
    
    @IBOutlet weak var issueImageView: UIImageView!
    @IBOutlet weak var stateLabel: UILabel!
    
    func updateState(enabled: Bool) {
        if enabled {
            updateColor(background: Color.openBackground, text: Color.openText)
            stateLabel.text = State.open
            return
        }
        updateColor(background: Color.closeBackground, text: Color.closeText)
        stateLabel.text = State.close
    }
    
    private func updateColor(background: UIColor, text: UIColor) {
        backgroundColor = background
        issueImageView.tintColor = text
        stateLabel.textColor = text
    }
}

private extension IssueStateView {
    enum Color {
        static let openBackground: UIColor = .init(red: 240/255, green: 251/255, blue: 242/255, alpha: 1)
        static let closeBackground: UIColor = .init(red: 240/255, green: 186/255, blue: 191/255, alpha: 1)
        static let openText: UIColor = .init(red: 98/255, green: 156/255, blue: 100/255, alpha: 1)
        static let closeText: UIColor = .init(red: 186/255, green: 48/255, blue: 49/255, alpha: 1)
    }
    
    enum State {
        static let open: String = "open"
        static let close: String = "close"
    }
}
