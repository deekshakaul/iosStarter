//
//  NSUrlSessionExample.swift
//  NSUrlSessionExample
//
//  Created by Deeksha Kaul on 04/10/18.
//  Copyright © 2018 Deeksha Kaul. All rights reserved.
//

import Foundation

class NSUrlSessionExample {
    
    func parseJSON( completion : @escaping (NSArray) ->Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            print(error)
            guard let unwrappedData = data else { print("Oops!! something went wrong")
                return }
            do {
                let str = try JSONSerialization.jsonObject(with: unwrappedData, options: .allowFragments) as! NSArray
//                print(str)
                completion(str)
            } catch {
                print("json error: \(error)")
            }
        }
        
        task.resume()
        
    }
}
