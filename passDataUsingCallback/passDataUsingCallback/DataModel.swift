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
        // the data was received and parsed to String
        DataModel.data = incomingData!
        print(incomingData,"received by dataModel")
    }
    
    func getData(completion: ((_ data: String) -> Void)) {
        // the data was received and parsed to String
        print("data in getdata data model",DataModel.data)
        completion(DataModel.data)
    }
}
