//
//  CommentAddViewController.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/11.
//

import UIKit
import MarkdownKit

class CommentAddViewController: UIViewController {

    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var previewTextView: UITextView!
    @IBOutlet weak var commentTextView: UITextView!
    private var markdownParser: MarkdownParser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewSetupView()
        commentTextView.delegate = self
        previewTextView.isHidden = true
        markdownParser = MarkdownParser()
    }
    
    private func textViewSetupView() {
        
        commentTextView.text = Constant.commentSet
        commentTextView.textColor = .lightGray
    }
    
    private func convertMarkdown() {
        
        guard let markdownParser = markdownParser,
              let str = commentTextView.text else { return }
        let parsedString = markdownParser.parse(str).string
        previewTextView.text = parsedString
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
    
    @IBAction func uploadButtonPressed() {
        print("upload")
    }
    
}

extension CommentAddViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView.text != Constant.commentSet &&
            textView.text != Constant.beginEdting {
            return
        }
        textView.text = Constant.beginEdting
        textView.textColor = .black
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if textView.text == Constant.beginEdting {
            commentTextViewSet()
        }
    }
        
    private func commentTextViewSet() {
        
        commentTextView.text = Constant.commentSet
        commentTextView.textColor = .lightGray
    }
}

private extension CommentAddViewController {
    
    enum Constant {
        static let insertPhoto: String = "Insert Photo"
        static let commentSet: String = "코멘트는 여기에 작성하세요"
        static let beginEdting: String = ""
    }
}

