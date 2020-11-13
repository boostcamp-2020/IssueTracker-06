//
//  UserCollectionViewSetting.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/11/12.
//

import UIKit

class UserCollectionViewSetting: NSObject {
    
    private let collectionView: UICollectionView
    private var users = [User]()
    private var selectedUsers = [User]() {
        didSet {
            collectionView.reloadData()
        }
    }

    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    func update(users: [User]) {
        self.users = users
    }
}

extension UserCollectionViewSetting: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constant.selectUserCell,
            for: indexPath)
        
        guard let selectUserCell = cell as? SelectUserCollectionViewCell,
              let user = users[safe: indexPath.row]
        else {
            return cell
        }
        selectUserCell.configureCell(with: user)
        ImageDataManager().get(id: user.id, successHandler: {
            selectUserCell.configureImage(with: $0)
        })
        return cell
    }
}

extension UserCollectionViewSetting: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let user = users[safe: indexPath.row] else { return }
        switchIsSelected(user: user)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath) {
        
        guard let cell = cell as? SelectUserCollectionViewCell,
              let user = users[safe: indexPath.row]
        else {
            return
        }
        let isSelected = selectedUsers.contains(user)
        cell.updateCheckState(isSelected: isSelected)
    }
    
    private func switchIsSelected(user: User) {
        if selectedUsers.contains(user) {
            selectedUsers.removeAll { $0 == user}
            return
        }
        selectedUsers.append(user)
    }
}

private extension UserCollectionViewSetting {
    
    enum Constant {
        static let selectUserCell: String = "SelectUserCell"
    }
}
