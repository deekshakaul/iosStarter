//
//  SecondViewController.swift
//  passDataUsingCallback
//
//  Created by Deeksha Kaul on 28/09/18.
//  Copyright © 2018 Deeksha Kaul. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var dataModel = DataModel()
    
    @IBOutlet weak var dataFromView2: UITextField!
    
    @IBOutlet weak var dataReceicedFromView1: UILabel? = nil

    let sampleVale:String = "default value"
    
    @IBAction func goToView1(_ sender: UIButton) {
        dataModel.setData(incomingData: dataFromView2!.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataReceicedFromView1?.text! = DataModel.data
    }
    

}
