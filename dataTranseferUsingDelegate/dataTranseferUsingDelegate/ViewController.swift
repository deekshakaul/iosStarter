//
//  ViewController.swift
//  dataTranseferUsingDelegate
//
//  Created by Deeksha Kaul on 01/10/18.
//  Copyright © 2018 Deeksha Kaul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SecondViewControllerDelegate {
    
    @IBOutlet weak var dataComingBack: UILabel!
    @IBOutlet weak var textFromView1: UITextField!
    
    func doSomethingWith(data: String) {
        dataComingBack.text = data
        print(dataComingBack.text!,"came back to first cv")
    }
  
    override func viewDidLoad() {
        print("in first vc")
        super.viewDidLoad()
        dataComingBack.backgroundColor = UIColor.red
        dataComingBack.text = "kjwqewejkqhq"
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
            print("in btn action");
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            print("!!!!!!!!!!", vc.incomingDataValue)
            print("!@!@@!@!@!@!@!@",vc.dataFromView1)
            vc.incomingDataValue = textFromView1.text!
            vc.delegate = self
            vc.navigationItem.setHidesBackButton(true, animated:true)
            self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

