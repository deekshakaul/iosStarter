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
        // image layout
        contentView.addSubview(profileImageView)
        contentView.addSubview(cellLabel)
        contentView.addSubview(cellDescription)
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        profileImageView.bottomAnchor.constraint(greaterThanOrEqualTo: self.bottomAnchor, constant: 10)
        // label layout
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        cellLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor).isActive = true
        cellLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cellLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        cellLabel.numberOfLines = 0
        // description layout
        cellDescription.translatesAutoresizingMaskIntoConstraints = false
        cellDescription.topAnchor.constraint(equalTo: cellLabel.bottomAnchor).isActive = true
        cellDescription.leadingAnchor.constraint(equalTo: cellLabel.leadingAnchor).isActive = true
        cellDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        cellDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        cellDescription.heightAnchor.constraint(greaterThanOrEqualToConstant: 200)
        cellDescription.lineBreakMode = .byWordWrapping
        cellDescription.numberOfLines = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("some error")
    }
}
