//
//  NewIssueAddViewController.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/09.
//

import UIKit

class NewIssueAddViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        textViewSetupView()
        let menuItem = UIMenuItem(title: Constant.insertPhoto, action: #selector(insertPhoto))
        UIMenuController.shared.menuItems = [menuItem]
    }
    
    private func textViewSetupView() {
        textView.text = Constant.commentSet
        textView.textColor = .lightGray
    }
    
    @objc func insertPhoto() {
        print("insert photo")
    }

}

extension NewIssueAddViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = Constant.commentString
        textView.textColor = .black
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == Constant.commentString {
            textViewSetupView()
        }
    }
}

private extension NewIssueAddViewController {
    enum Constant {
        static let insertPhoto: String = "Insert Photo"
        static let commentSet: String = "코멘트는 여기에 작성하세요"
        static let commentString: String = ""
    }
}
