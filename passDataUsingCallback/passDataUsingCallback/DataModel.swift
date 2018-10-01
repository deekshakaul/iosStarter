//
//  DataModel.swift
//  passDataUsingCallback
//
//  Created by Deeksha Kaul on 28/09/18.
//  Copyright © 2018 Deeksha Kaul. All rights reserved.
//

import Foundation
class DataModel {
    static var data = ""
    func setData(incomingData: String?) {
        DataModel.data = incomingData!
    }
}
