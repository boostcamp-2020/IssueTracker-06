//
//  FilterSelectViewController.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/02.
//
import UIKit

class FilterSelectViewController: UIViewController {
    
    // 필터 화면 선택 추가
    private var issuesData: Issues?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func CancelPressed(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func doneButtonTouched(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    // 필터 화면 선택 추가
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ContainerViewSegue" {
            let filterSelectTabelViewController = segue.destination as? FilterSelectTableViewController
            filterSelectTabelViewController?.issues = issuesData
        }
    }
    
}

// 필터 화면 선택 추가
extension FilterSelectViewController: IssuesFilterDelegate {
    
    func issues(_ issues: Issues) {
        issuesData = issues
    }
}
