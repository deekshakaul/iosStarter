//
//  ViewController.swift
//  NSUrlSessionExample
//
//  Created by Deeksha Kaul on 04/10/18.
//  Copyright © 2018 Deeksha Kaul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var NSUrl = NSUrlSessionExample()
    var tableView = UITableView()
    var tableArray:NSArray?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            guard self.tableArray == nil else{
                return self.tableArray!.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "my", for: indexPath)
        guard self.tableArray == nil else{
            let row = tableArray![indexPath.row] as! NSDictionary
            cell.textLabel!.text = String(describing: row["title"]!)
            return cell
        }
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        var activityIndicator = ActivityIndicator(view:view)
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "my")
        view.addSubview(tableView)
        self.tableView.tableFooterView = UIView()
        
        activityIndicator.showActivityIndicator()
        
        NSUrl.parseJSON(completion: {result in
            self.tableArray = result
            self.tableView.reloadData()
            activityIndicator.stopActivityIndicator()
            
        })
        
    }

}

