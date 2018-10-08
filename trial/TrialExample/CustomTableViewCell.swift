//
//  CustomTableCell.swift
//  NSUrlSessionExample
//
//  Created by Deeksha Kaul on 08/10/18.
//  Copyright © 2018 Deeksha Kaul. All rights reserved.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell{
    var cellImage = UIImageView()
    var cellLabel = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cellImage)
        contentView.addSubview(cellLabel)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("some error")
    }
}
