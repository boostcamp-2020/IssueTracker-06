//
//  AssigneeView.swift
//  IssueTracker
//
//  Created by eunjeong lee on 2020/10/29.
//

import UIKit

final class AssigneeView: UIView {
    
    static func create(user: User) -> AssigneeView {
        let assigneeView = AssigneeView()
        let userNamelabel = UILabel()
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        userNamelabel.text = user.name
        userNamelabel.font = userNamelabel.font.withSize(Metric.fontSize)
        userNamelabel.textColor = .darkGray
        imageView.clipsToBounds = true
        imageView.cornerRadius = Metric.cornerRadius
        assigneeView.addSubview(imageView)
        assigneeView.addSubview(userNamelabel)
        
        assigneeView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        userNamelabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 60),
            imageView.heightAnchor.constraint(equalToConstant: 60),
            imageView.topAnchor.constraint(equalTo: assigneeView.topAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: assigneeView.trailingAnchor, constant: -8),
            imageView.bottomAnchor.constraint(equalTo: userNamelabel.topAnchor, constant:  8),
            userNamelabel.bottomAnchor.constraint(equalTo: assigneeView.bottomAnchor, constant: 8),
            userNamelabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
        ])
        return assigneeView
    }
}

private extension AssigneeView {
    enum Metric {
        static let cornerRadius: CGFloat = 9
        static let fontSize:CGFloat = 13
    }
}
