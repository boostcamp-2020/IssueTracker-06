//
//  FilterSelectViewController.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/11/02.
//

import UIKit

class FilterSelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func CancelPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
