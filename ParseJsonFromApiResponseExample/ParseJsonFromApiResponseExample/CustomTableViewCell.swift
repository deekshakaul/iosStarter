//
//  CustomTableCell.swift
//  NSUrlSessionExample
//
//  Created by Deeksha Kaul on 08/10/18.
//  Copyright © 2018 Deeksha Kaul. All rights reserved.

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell{
    var cellLabel = UILabel()
    var cellDescription = UILabel()
    let profileImageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.clipsToBounds = true
        return img
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.clipsToBounds = true
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        cellDescription.translatesAutoresizingMaskIntoConstraints = false
        cellLabel.numberOfLines = 0
        cellDescription.numberOfLines = 0
        cellDescription.lineBreakMode = .byWordWrapping
        
        // image layout
        contentView.addSubview(profileImageView)
        contentView.addSubview(cellLabel)
        contentView.addSubview(cellDescription)
        NSLayoutConstraint.activate([
        profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
        profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10),
        profileImageView.widthAnchor.constraint(equalToConstant:40),
        profileImageView.heightAnchor.constraint(equalToConstant:40),

        // label layout

        cellLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
        cellLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant:10),
        cellLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        cellLabel.heightAnchor.constraint(equalToConstant: 40),

        // description layout
        cellDescription.topAnchor.constraint(equalTo: cellLabel.bottomAnchor, constant:10),
        cellDescription.leadingAnchor.constraint(equalTo: cellLabel.leadingAnchor),
        cellDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:-10),
        cellDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("some error")
    }

}
