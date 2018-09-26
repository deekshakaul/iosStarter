//
//  ViewController.swift
//  myApp
//
//  Created by Deeksha Kaul on 21/09/18.
//  Copyright © 2018 Deeksha Kaul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    
    @IBOutlet weak var textRecievedFromView2: UILabel!
    @IBOutlet weak var textFromView1: UITextField!
    
    var firstDataValue:String!
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "btnSubmitFromView1") {
            let svc = segue.destination as! SecondViewController
            svc.firstDataValue = textFromView1.text
           // print(textFromView1.text ?? <#default value#>);
            print("************");
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(firstDataValue,"***")
        textRecievedFromView2.text = firstDataValue
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btn(_ sender: Any) {
        print("in btn action");
        print(textFromView1.text);
       
    }
    
}

