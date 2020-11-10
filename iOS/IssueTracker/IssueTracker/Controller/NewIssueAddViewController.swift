//
//  NewIssueAddViewController.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/09.
//

import UIKit
import MarkdownKit

class NewIssueAddViewController: UIViewController {

    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var previewTextView: UITextView!
    @IBOutlet weak var contentTextView: UITextView!
    private var markdownParser: MarkdownParser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentTextView.delegate = self
        commentTextView.delegate = self
        let menuItem = UIMenuItem(title: Constant.insertPhoto, action: #selector(insertPhoto))
        UIMenuController.shared.menuItems = [menuItem]
        previewTextView.isHidden = true
        markdownParser = MarkdownParser()
        textViewSetupView()
    }
    
    private func textViewSetupView() {
        contentTextView.text = Constant.contentSet
        contentTextView.textColor = .lightGray
        commentTextView.text = Constant.commentSet
        commentTextView.textColor = .lightGray
    }
    
    @objc func insertPhoto() {
        print("insert photo")
    }
    
    @IBAction func uploadButtonPressed() {
        if titleTextField.text == "" {
            return
        }
        print("upload")
    }
    
    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            commentTextView.isHidden = true
            previewTextView.isHidden = false
            convertMarkdown()
            return
        }
        commentTextView.isHidden = false
        previewTextView.isHidden = true
    }
    
    func convertMarkdown() {
        guard let markdownParser = markdownParser,
              let str = commentTextView.text else { return }
        let parsedString = markdownParser.parse(str).string
        previewTextView.text = parsedString
    }
    
}

extension NewIssueAddViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .black {
            return
        }
        textView.text = Constant.beginEdting
        textView.textColor = .black
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == Constant.beginEdting {
            textView == commentTextView ? commentTextViewSet() : contentTextViewSet()
        }
    }
    
    func contentTextViewSet() {
        contentTextView.text = Constant.contentSet
        contentTextView.textColor = .lightGray
    }
    
    func commentTextViewSet() {
        commentTextView.text = Constant.contentSet
        commentTextView.textColor = .lightGray
    }
}

private extension NewIssueAddViewController {
    enum Constant {
        static let insertPhoto: String = "Insert Photo"
        static let contentSet: String = "콘텐츠는 여기에 작성하세요"
        static let commentSet: String = "코멘트는 여기에 작성하세요"
        static let beginEdting: String = ""
    }
}
