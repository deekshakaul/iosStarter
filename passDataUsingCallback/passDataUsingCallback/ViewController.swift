//
//  ViewController.swift
//  passDataUsingCallback
//
//  Created by Deeksha Kaul on 28/09/18.
//  Copyright © 2018 Deeksha Kaul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var dataModel = DataModel()
    @IBOutlet weak var dataFromFirstView: UITextField!
    
    @IBOutlet weak var dataReceivedFromView2: UILabel!
    @IBAction func GoToView2(_ sender: UIButton) {
        dataModel.setData(incomingData: dataFromFirstView!.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataReceivedFromView2?.text = DataModel.data
        }
    
    private func useData(data: String) {
        print(data,"data in use data in first view")
        }

    }
