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
        let presentedVC = SecondViewController()
        presentedVC.incomingVal = dataFromFirstView.text
        self.present(presentedVC, animated: false, completion: nil)
        
//        dismiss(animated: true, completion: nil)

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

//        dataModel.getData(completion: { [weak self] (data: String) in
//            self?.getData(data: data)
//        })
        
        }
        private func useData(data: String) {
            print(data,"data in use data in first view")
        }
    private func getData(data: String) {
        dataReceivedFromView2!.text = data
        print(data,"data in getdata in first view")
    }
    // Do any additional setup after loading the view, typically from a nib.
    }
