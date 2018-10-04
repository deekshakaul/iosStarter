//
//  ViewController.swift
//  PickerView
//
//  Created by Deeksha Kaul on 04/10/18.
//  Copyright © 2018 Deeksha Kaul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var picker: UIPickerView!
    var data :[[String]] = [[String]]()
    override func viewDidLoad() {
        self.picker.delegate = self
        self.picker.dataSource = self
        super.viewDidLoad()
         data = [["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"],["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"],["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"],["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("data selected is: \(data[component][row])")
    }

}

