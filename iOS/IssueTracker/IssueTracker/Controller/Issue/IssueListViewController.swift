//
//  ViewController.swift
//  IssueTracker
//
//  Created by 박태희 on 2020/10/27.
//

import UIKit

protocol IssueListViewControllerDelegate: class {
    func issueId(_ id: Int)
}

final class IssueListViewController: UIViewController {

    @IBOutlet private weak var issueListCollectionView: UICollectionView!
    @IBOutlet weak var leftBarButton: UIBarButtonItem!
    @IBOutlet weak var rightBarButton: UIBarButtonItem!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addIssueButton: UIButton!
    @IBOutlet weak var bottomToolbar: UIToolbar!
    
    private var selectedIndexPath: IndexPath?
    private var issues: Issues?
    private var selectedIssues = Issues() {
        didSet {
            issueListCollectionViewSetting?.update(selectedIssues: selectedIssues)
        }
    }
    
    private var mode: IssueListCellMode = .normal {
        didSet {
            selectedIssues = Issues()
            let isEditMode = mode.isEditMode
            tabBarController?.tabBar.isHidden = isEditMode
            view.layoutIfNeeded()
            issueListCollectionViewSetting?.cellMode = mode
            bottomToolbar.isHidden = !isEditMode
            tapGesture.isEnabled = !isEditMode
            editViewTapGesture.isEnabled = isEditMode
            view.layoutIfNeeded()
            addIssueButton.isHidden = isEditMode
            let rightBarButtonTitle = isEditMode ? "Cancel" : "Edit"
            let leftBarButtonTitle = isEditMode ? "SelectAll" : "Filter"
            let leftBarButtonAction =
                isEditMode ? #selector(selectAllButtonTouched(_:)) : #selector(filterButtonTouched(_:))
            rightBarButton.title = rightBarButtonTitle
            leftBarButton.title = leftBarButtonTitle
            leftBarButton.action = leftBarButtonAction
            
            let titleText = isEditMode ? "\(selectedIssues.count.selectedCountText)" : "이슈"
            titleLabel.text = titleText
        }
    }
    
    private lazy var issueListCollectionViewSetting: IssueListCollectionViewSetting? = {
        guard let issues = issues else { return nil }
        return IssueListCollectionViewSetting(
            collectionView: issueListCollectionView,
            data: issues)
    }()
    
    private lazy var tapGesture: UITapGestureRecognizer = {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(cellTouched(_:)))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        tapGestureRecognizer.isEnabled = true
        tapGestureRecognizer.cancelsTouchesInView = false
        return tapGestureRecognizer
    }()
    
    private lazy var editViewTapGesture: UITapGestureRecognizer = {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(editCellTouched(_:)))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        tapGestureRecognizer.isEnabled = false
        tapGestureRecognizer.cancelsTouchesInView = false
        return tapGestureRecognizer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureIssuesData()
        removeNavigationBarUnderLine()
    }
    
    private func configureIssuesData() {
        IssueListDataManager().get(successHandler: { [weak self] in
            self?.issues = $0
            self?.configureIssueListCollectionView()
        })
    }

    private func configureIssueListCollectionView() {
        issueListCollectionView.delegate = issueListCollectionViewSetting
        issueListCollectionView.dataSource = issueListCollectionViewSetting
        issueListCollectionView.addGestureRecognizer(tapGesture)
        issueListCollectionView.addGestureRecognizer(editViewTapGesture)
    }

    private func removeNavigationBarUnderLine() {
        navigationController?.navigationBar.shadowImage = UIImage()
    }

    @objc private func cellTouched(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: issueListCollectionView)
        guard let indexPath = issueListCollectionView.indexPathForItem(at: point) else { return }
        selectedIndexPath = indexPath
        moveToIssueDetailViewController()
    }
    
    @objc private func editCellTouched(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: issueListCollectionView)
        guard let indexPath = issueListCollectionView.indexPathForItem(at: point),
              let issue = issues?[indexPath.row]
        else { return }
        switchIssueSelected(issue: issue)
        titleLabel.text = selectedIssues.count.selectedCountText
        issueListCollectionView.reloadData()
    }
    
    private func switchIssueSelected(issue: Issue) {
        if selectedIssues.contains(issue: issue) {
            selectedIssues.remove(issue: issue)
            return
        }
        selectedIssues.add(issue: issue)
    }
    
    @objc private func filterButtonTouched(_ sender: UIBarButtonItem) {
        moveToIssueFilterViewController()
    }
    
    @objc private func selectAllButtonTouched(_ sender: UIBarButtonItem) {
        guard let issues = issues else { return }
        selectedIssues = issues
        titleLabel.text = selectedIssues.count.selectedCountText
        issueListCollectionViewSetting?.update(selectedIssues: issues)
        issueListCollectionView.reloadData()
    }

    private func moveToIssueDetailViewController() {
        performSegue(withIdentifier: Constant.issueDetailSegue, sender: nil)
    }
    
    private func moveToIssueFilterViewController() {
        performSegue(withIdentifier: Constant.filterSegue, sender: nil)
    }
    
    @IBAction func rightBarButtonTouched(_ sender: UIBarButtonItem) {
        mode = mode.switchMode
    }
    
    @IBAction func selectedIssuesCloseButton(_ sender: UIBarButtonItem) {
        
    }
    
    @IBSegueAction func presentIssueDeatilViewController(_ coder: NSCoder) -> IssueDetailViewController? {
        let issueDetailViewController = IssueDetailViewController(coder: coder)
        guard let selectedIndexPath = selectedIndexPath,
              let issueId = issues?[selectedIndexPath.row]?.id
        else {
            return issueDetailViewController
        }
        issueDetailViewController?.issueId(issueId)
        return issueDetailViewController
    }
}

private extension IssueListViewController {
    
    enum Constant {
        static let filterSegue: String = "FilterSegue"
        static let issueDetailSegue: String = "IssueDetailSegue"
    }
}

private extension Int {
    
    var selectedCountText: String {
        "\(self)개 선택"
    }
}
