//
//  NewIssueAddViewController.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/09.
//
import UIKit
import MarkdownKit

class NewIssueAddViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var previewTextView: UITextView!
    @IBOutlet weak var contentTextView: UITextView!
    private var markdownParser: MarkdownParser?
    var issue: DetailIssue?
    var mode: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewSetupView()
        selectMode()
        contentTextView.delegate = self
        commentTextView.delegate = self
        let menuItem = UIMenuItem(title: Constant.insertPhoto, action: #selector(insertPhoto))
        UIMenuController.shared.menuItems = [menuItem]
        previewTextView.isHidden = true
        markdownParser = MarkdownParser()
        //키보드 추가
        configureKeyboardNotification()
    }
    
    private func selectMode() {
        
        guard let mode = mode else { return }
        if mode == Mode.modifyMode.rawValue {
            segmented.isHidden = true
            previewTextView.isHidden = true
            commentTextView.isHidden = true
            getIssueData()
        }
    }
    
    private func getIssueData() {
        guard let detailIssue = issue else { return }
        titleTextField.text = detailIssue.title
        contentTextView.text = detailIssue.content
        contentTextView.textColor = .black
    }
    
    private func textViewSetupView() {
        
        contentTextView.text = Constant.contentSet
        contentTextView.textColor = .lightGray
        commentTextView.text = Constant.commentSet
        commentTextView.textColor = .lightGray
    }
    
    //키보드 추가
    private lazy var keyboardHide: UITapGestureRecognizer = {
        let tapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )
        tapGestureRecognizer.numberOfTouchesRequired = 1
        tapGestureRecognizer.isEnabled = true
        tapGestureRecognizer.cancelsTouchesInView = false
        return tapGestureRecognizer
    }()
    
    func configureKeyboardNotification() {
        view.addGestureRecognizer(keyboardHide)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func insertPhoto() {
        print("insert photo")
    }
    
    @IBAction func uploadButtonPressed() {
        if titleTextField.text == Constant.beginEdting ||
            contentTextView.text == Constant.beginEdting ||
            contentTextView.text == Constant.contentSet {
            return
        }
        if mode != Mode.modifyMode.rawValue {
            // 새이슈 작성
            guard let title = titleTextField.text else { return }
            guard let content = contentTextView.text else { return }
            let issueDataManager = IssueListDataManager()
            let newIssue = Issue.NewIssue(
                title: title,
                content: content,
                milestoneId: nil,
                labelIds: nil,
                assigneeIds: nil)
            
            issueDataManager.post(
                body: newIssue,
                successHandler: { response in
                    guard let issueId = response else { return }
                    self.commentPost(issueId: issueId)
                },
                errorHandler: nil
            )
        } else {
            // 이슈 수정
            guard let title = titleTextField.text else { return }
            guard let content = contentTextView.text else { return }
            guard let id = issue?.id else { return }
            let detailIssueDataManager = DetailIssueDataManager()
            let modifiedTitle = DetailIssue.patchTitleDetailIssue(title: title)
            let modifiedContent = DetailIssue.patchContentDetailIssue(content: content)
            
            detailIssueDataManager.patchTitle(
                id: id,
                body: modifiedTitle,
                successHandler: nil,
                errorHandler: nil
            )
        
            detailIssueDataManager.patchContent(
                id: id,
                body: modifiedContent,
                successHandler: nil,
                errorHandler: nil
            )
        }
        
        self.navigationController?.popViewController(animated: false)
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
    
    private func commentPost(issueId: Int) {
        
        if commentTextView.text == Constant.commentSet
            || commentTextView.text == Constant.beginEdting {
            return
        }
        convertMarkdown()
        guard let content = previewTextView.text else { return }
        let commentDataManager = CommentDataManager()
        let newComment = Comment.NewComment(content: content, issueId: issueId)
        commentDataManager.post(body: newComment, successHandler: nil, errorHandler: nil)
    }
    
    private func convertMarkdown() {
        
        guard let markdownParser = markdownParser,
              let str = commentTextView.text else { return }
        let parsedString = markdownParser.parse(str).string
        previewTextView.text = parsedString
    }
    
}

extension NewIssueAddViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
    
        if textView == commentTextView && mode != Mode.modifyMode.rawValue {
            var point = textView.frame.origin
            point.x = 0
            point.y -= 60
            scrollView.setContentOffset(point, animated: true)
        }
        
        if textView.text != Constant.commentSet &&
            textView.text != Constant.contentSet &&
            textView.text != Constant.beginEdting {
            return
        }
        textView.text = Constant.beginEdting
        textView.textColor = .black
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if textView == commentTextView && mode != Mode.modifyMode.rawValue {
            var point = textView.frame.origin
            point.x = 0
            point.y = 0
            scrollView.setContentOffset(point, animated: true)
        }
        
        if textView.text == Constant.beginEdting {
            textView == commentTextView ? commentTextViewSet() : contentTextViewSet()
        }
    }
    
    private func contentTextViewSet() {
        
        contentTextView.text = Constant.contentSet
        contentTextView.textColor = .lightGray
    }
    
    private func commentTextViewSet() {
        
        commentTextView.text = Constant.commentSet
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
    
    enum Mode: String {
        case modifyMode = "modify"
        case insertMode = "insert"
    }
}
