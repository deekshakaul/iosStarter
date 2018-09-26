//
//  SecondViewController.swift
//  myApp
//
//  Created by Deeksha Kaul on 21/09/18.
//  Copyright © 2018 Deeksha Kaul. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var textFromView2: UITextField!
    @IBOutlet weak var textRecievedFromView1: UILabel!
    
    var firstDataValue:String!
   
    override func prepare (for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "btnSubmitFromView2") {
            let svc = segue.destination as! ViewController
            svc.firstDataValue = textFromView2.text
            print(textFromView2.text);
            print("************");
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(firstDataValue,"***")
        textRecievedFromView1.text = firstDataValue
        

        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
