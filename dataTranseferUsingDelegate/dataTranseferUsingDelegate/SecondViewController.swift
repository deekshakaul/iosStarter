//
//  SecondViewController.swift
//  dataTranseferUsingDelegate
//
//  Created by Deeksha Kaul on 01/10/18.
//  Copyright © 2018 Deeksha Kaul. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate : NSObjectProtocol{
    func doSomethingWith(data: String)
}
class SecondViewController: UIViewController {
    
    @IBAction func sendDataBack(_ sender: UIButton) {
        if let delegate = delegate{
            delegate.doSomethingWith(data: dataFromView1.text! + "!!!!!!!")
            self.navigationItem.setHidesBackButton(true, animated:true)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBOutlet weak var dataFromView1: UILabel!
    
    var incomingDataValue :String!
    
    weak var delegate : SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        print("in second vc")
        super.viewDidLoad()
        print(incomingDataValue,"!!!!!!!!!!!!")
        dataFromView1.text = incomingDataValue

    }

}
