//
//  ViewController.swift
//  NSUrlSessionExample
//
//  Created by Deeksha Kaul on 04/10/18.
//  Copyright © 2018 Deeksha Kaul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var row = NSDictionary()
    var NSUrl = TrialExample()
    var tableView = UITableView()
    var tableArray:NSArray?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            guard self.tableArray == nil else{
                return self.tableArray!.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "my", for: indexPath) as! CustomTableViewCell
        guard self.tableArray == nil else{
            self.row = tableArray![indexPath.row] as! NSDictionary
            let imageName = "/Users/de32222t/Downloads/em2.jpg"
            let image = UIImage(named: imageName)
            cell.cellImage.frame = CGRect(x: 40, y: 0, width: 40, height: 40)
            cell.cellImage.image = image
            cell.cellLabel.text = self.row["title"]! as! String
            cell.cellLabel.frame = CGRect(x:100, y:0, width: 200, height: 40)
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
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "my")
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

