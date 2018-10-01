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
    
    var incomingVal: String?
    
    @IBOutlet weak var dataFromView2: UITextField!
    
    @IBOutlet weak var dataReceicedFromView1: UILabel? = nil

    let sampleVale:String = "default value"
    
    @IBAction func goToView1(_ sender: UIButton) {
        print("before going to view 1...",dataFromView2)
        dataModel.setData(incomingData: dataFromView2!.text)
        let presentedVC = SecondViewController()
        present(presentedVC, animated: true, completion: nil)
        if let presenter = ViewController() as? ViewController {
            presenter.dataReceivedFromView2!.text = dataFromView2!.text
        }
//        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(sampleVale)
        
        
        
        print("Eeeeeeeeeeee",dataReceicedFromView1)
        dataReceicedFromView1?.text! = incomingVal!
        print(dataReceicedFromView1?.text)
//        dataModel.getData(completion: { [weak self] (data: String) in
//            self?.getData(data: data)
//        })
        // Do any additional setup after loading the view.
    }
    
    private func useData(data: String) {
        print(data,"data in use data in second view")
    }
//    private func getData(data: String) {
//        dataReceicedFromView1!.text = data
//        print(dataReceicedFromView1.text,"data in getData second view")
//    }
    
}
