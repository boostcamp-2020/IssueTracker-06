//
//  SelectViewController.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/12.
//

import UIKit

class SelectViewController: UIViewController {

    enum DataType {
        case assignee
        case label
        case milestone
        
        var type: Codable.Type {
            switch self {
            case .assignee:
                return [User].self
            case .label:
                return Labels.self
            case .milestone:
                return Milestone.self
            }
        }
    }
    
    @IBOutlet private weak var selectCollectionView: UICollectionView!
    @IBOutlet private weak var backgroundView: UIView!
    private let dataType: DataType
    private var background: UIView?
    var selectedHandler: ((Codable) -> Void)?
    
    private lazy var labelCollectionViewSetting = {
        LabelCollectionViewSetting(collectionView: selectCollectionView)
    }()
    private lazy var milestoneCollectionViewSetting = {
        MilestoneCollectionViewSetting(collectionView: selectCollectionView)
    }()
    private lazy var userCollectionViewSetting = {
        UserCollectionViewSetting(collectionView: selectCollectionView)
    }()

    init(dataType: DataType) {
        self.dataType = dataType
        super.init(nibName: Constant.selectViewController, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.dataType = .label
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        configureData()
        configureBackground()
        navigationController?.navigationBar.isHidden = true
    }
    
    func setBackground(view: UIView) {
        background = view
    }
    
    private func configureBackground() {
        guard let background = background else { return }
        background.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(background)
        background.setConstraintToFit(at: backgroundView)
    }
    
    @IBAction private func cancelButtonTouched(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction private func selectCompleteButtonTouched(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
}

// MARK: configure
private extension SelectViewController {
    
    func registerNib() {
        let nib = UINib(nibName: Constant.selectCollectionViewCell, bundle: nil)
        let userCellNib = UINib(nibName: Constant.selectUserCollectionViewCell, bundle: nil)
        selectCollectionView.register(nib, forCellWithReuseIdentifier: Constant.selectCell)
        selectCollectionView.register(userCellNib, forCellWithReuseIdentifier: Constant.selectUserCell)
    }
    
    func configureData() {
        switch dataType {
        case .assignee:
            userCollectionViewSetting.update(users: [
                User(profile: "", name: "eunjeongS2", email: "", id: 1),
                User(profile: "", name: "Eunbin-Kim", email: "", id: 2),
                User(profile: "", name: "16010948", email: "", id: 3),
                User(profile: "", name: "teaheepp", email: "", id: 4),
                User(profile: "", name: "cyjo9603", email: "", id: 5)
            ])
            selectCollectionView.dataSource = userCollectionViewSetting
            selectCollectionView.delegate = userCollectionViewSetting
            
        case .label:
            configureLabelData() { [weak self] in
                self?.labelCollectionViewSetting.update(labels: $0)
                self?.selectCollectionView.dataSource = self?.labelCollectionViewSetting
                self?.selectCollectionView.delegate = self?.labelCollectionViewSetting
            }
            
        case .milestone:
            configureMilestoneData() { [weak self] in
                self?.milestoneCollectionViewSetting.update(milestones: $0)
                self?.selectCollectionView.dataSource = self?.milestoneCollectionViewSetting
                self?.selectCollectionView.delegate = self?.milestoneCollectionViewSetting
            }
        }
    }
    
    func configureLabelData(completionHandler: ((Labels) -> Void)? = nil) {
        LabelListDataManager().get(successHandler: {
            guard let labels = $0 else { return }
            completionHandler?(labels)
        })
    }
    
    func configureMilestoneData(completionHandler: ((Milestones) -> Void)? = nil) {
        MilestoneDataManager().get(successHandler: {
            guard let milestones = $0 else { return }
            completionHandler?(milestones)
        })
    }
}

extension SelectViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: selectCollectionView.frame.width, height: 73)
    }
}

private extension SelectViewController {
    
    enum Constant {
        static let selectViewController: String = "SelectViewController"
        static let selectCell: String = "SelectCell"
        static let selectUserCell: String = "SelectUserCell"
        static let selectCollectionViewCell: String = "SelectCollectionViewCell"
        static let selectUserCollectionViewCell: String = "SelectUserCollectionViewCell"
    }
}
