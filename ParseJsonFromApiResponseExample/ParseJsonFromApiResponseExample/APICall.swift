//
//  NSUrlSessionExample.swift
//  NSUrlSessionExample
//
//  Created by Deeksha Kaul on 04/10/18.
//  Copyright © 2018 Deeksha Kaul. All rights reserved.
//

import Foundation

class APICall {
    
    var title = ""
    var imageHref = ""
    var rows = [{}]
    
    func parseJSON( completion : @escaping (NSArray) ->Void) {
        let url = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts")
        let task = URLSession.shared.dataTask(with: url!) {
            (data, response, error) in do{
                print(data)
                let jsonString = String(decoding: data!, as: UTF8.self)
                let jsonData: Data? = jsonString.data(using: .utf8)

                let str = try JSONSerialization.jsonObject(with: jsonData!) as! NSDictionary
                print(str["rows"]!, type(of: str["rows"]!))
                completion(str["rows"]! as! NSArray)
            }
            catch {
                print("json error: \(error)")
            }
        }
        
        task.resume()
        
    }
}
