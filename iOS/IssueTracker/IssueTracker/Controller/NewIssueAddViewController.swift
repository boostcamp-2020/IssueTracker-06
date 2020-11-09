//
//  NewIssueAddViewController.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/09.
//

import UIKit
import MarkdownKit

class NewIssueAddViewController: UIViewController {

    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var previewTextView: UITextView!
    private var markdownParser: MarkdownParser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentTextView.delegate = self
        let menuItem = UIMenuItem(title: Constant.insertPhoto, action: #selector(insertPhoto))
        UIMenuController.shared.menuItems = [menuItem]
        previewTextView.isHidden = true
        markdownParser = MarkdownParser()
        textViewSetupView()
    }
    
    private func textViewSetupView() {
        contentTextView.text = Constant.commentSet
        contentTextView.textColor = .lightGray
    }
    
    @objc func insertPhoto() {
        print("insert photo")
    }
    
    @IBAction func uploadButtonPressed() {
        if subjectTextField.text == "" {
            return
        }
        print("upload")
    }
    
    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            contentTextView.isHidden = true
            previewTextView.isHidden = false
            convertMarkdown()
            return
        }
        contentTextView.isHidden = false
        previewTextView.isHidden = true
    }
    
    func convertMarkdown() {
        guard let markdownParser = markdownParser,
              let str = contentTextView.text else { return }
        previewTextView.text = markdownParser.parse(str).string
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
