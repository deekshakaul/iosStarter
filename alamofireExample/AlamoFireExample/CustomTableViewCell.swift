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
        
        let imageSize: CGFloat = traitCollection.horizontalSizeClass == .compact ? 40.0 : 70.0
        let fontSize: CGFloat = traitCollection.horizontalSizeClass == .compact ? 12.0 : 20.0
        cellDescription.font = UIFont(name: cellLabel.font.familyName, size: fontSize)
        cellLabel.font = UIFont(name: cellLabel.font.familyName, size: fontSize)
        
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
        profileImageView.widthAnchor.constraint(equalToConstant:imageSize),
        profileImageView.heightAnchor.constraint(equalToConstant:imageSize),

        // label layout

        cellLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
        cellLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant:10),
        cellLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        cellLabel.heightAnchor.constraint(equalToConstant: imageSize),

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
