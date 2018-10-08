//
//  TableViewCell.swift
//  NSUrlSessionExample
//
//  Created by Deeksha Kaul on 05/10/18.
//  Copyright © 2018 Deeksha Kaul. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell, UICollectionDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
