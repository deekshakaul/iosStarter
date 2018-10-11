//
//  ViewController.swift
//  NSUrlSessionExample
//
//  Created by Deeksha Kaul on 04/10/18.
//  Copyright © 2018 Deeksha Kaul. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var row = NSDictionary()
    var NSUrl = APICall()
    var tableView = UITableView()
    var tableArray:NSArray?
    var noDataAlert = UIAlertController(title: "Hold On...", message: "Some error fetching the data. Please make sure you are connected to open internet", preferredStyle: .alert)
    var defaultImage = "https://hollywoodhatesme.files.wordpress.com/2017/03/smiley.jpg"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard self.tableArray == nil else{
            return self.tableArray!.count
        }
        return 1
    }
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x:0, y:0, width:width, height:CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "my", for: indexPath) as! CustomTableViewCell
        guard self.tableArray == nil else{
            self.row = tableArray![indexPath.row] as! NSDictionary
            let imageName = type(of: self.row["imageHref"]!) == NSNull.self ? self.defaultImage : self.row["imageHref"]! as! String
            cell.profileImageView.sd_setImage(with: URL(string: imageName), placeholderImage: UIImage(named: self.defaultImage))

            cell.profileImageView.sd_setImage(with: URL(string: imageName), placeholderImage: UIImage(named: self.defaultImage),options: SDWebImageOptions(rawValue: 0), completed: { (image, error, cacheType, imageURL) in
                if error == nil {
                    cell.profileImageView.image = image
                }else {
                    cell.profileImageView.image = UIImage(named: self.defaultImage)
                }
            })
            cell.cellLabel.text = type(of: self.row["title"]!) == NSNull.self ? " " : self.row["title"]! as! String
            cell.cellDescription.text = type(of: self.row["description"]!) == NSNull.self ? " " : self.row["description"]! as! String
            return cell
        }
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let activityIndicator = ActivityIndicator(view:view)
        self.tableView = UITableView(frame: view.bounds, style: .plain)
        self.tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "my")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.view.addSubview(self.tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        activityIndicator.showActivityIndicator()
        NSUrl.parseJSON(completion: {result in
            self.tableArray = result
            if result.count > 0{
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    activityIndicator.stopActivityIndicator()
                }
            }
            else{
                self.noDataAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.destructive, handler: nil))
                self.present(self.noDataAlert, animated: true, completion: nil)
                activityIndicator.stopActivityIndicator()
            }
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 250.0
    }
    
}
