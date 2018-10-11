//
//  NSUrlSessionExample.swift
//  NSUrlSessionExample
//
//  Created by Deeksha Kaul on 04/10/18.
//  Copyright © 2018 Deeksha Kaul. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APICall {
    
    var title = ""
    var imageHref = ""
    var rows = [{}]
    
    func parseJSON( completion : @escaping (NSArray) ->Void) {
        
        Alamofire.request("https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts").responseJSON { (responseData) -> Void in
       
            if((responseData.data) != nil) {
                do {
                    let jsonString = String(decoding: responseData.data!, as: UTF8.self)
                    let jsonData: Data? = jsonString.data(using: .utf8)
                    let str = try JSONSerialization.jsonObject(with: jsonData!) as! NSDictionary
                    print(str["rows"]!, type(of: str["rows"]!))
                    completion(str["rows"]! as! NSArray)
                } catch {
                    print("in catch")
                }
            }
            }.resume()
    }
}
