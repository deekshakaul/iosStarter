//
//  ActivityIndicator.swift
//  NSUrlSessionExample
//
//  Created by Deeksha Kaul on 05/10/18.
//  Copyright © 2018 Deeksha Kaul. All rights reserved.
//

import UIKit

struct ActivityIndicator {
    
    let view: UIView
    let activityIndicatorView = UIActivityIndicatorView()
    let loadingTextLabel = UILabel()
    
    
    func showActivityIndicator() {
        activityIndicatorView.center = CGPoint(x: self.view.frame.size.width / 2.0 - 80, y: self.view.frame.size.height / 2.0)
        
        loadingTextLabel.textColor = UIColor.black
        loadingTextLabel.text = "Loading Data..."
        loadingTextLabel.sizeToFit()
        loadingTextLabel.center = CGPoint(x: activityIndicatorView.center.x + 80, y: activityIndicatorView.center.y)
        view.addSubview(loadingTextLabel)
        
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.activityIndicatorViewStyle = .gray
        view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
    }
    
    func stopActivityIndicator() {
        activityIndicatorView.stopAnimating()
        activityIndicatorView.removeFromSuperview()
        loadingTextLabel.removeFromSuperview()
    }
}
