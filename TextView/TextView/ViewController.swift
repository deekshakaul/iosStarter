//
//  ViewController.swift
//  TextView
//
//  Created by Deeksha Kaul on 03/10/18.
//  Copyright © 2018 Deeksha Kaul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateTxtView(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateTxtView(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true)

    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = UIColor.gray
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = UIColor.white
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        countLabel.text = String(textView.text.characters.count)
        return true
        
    }

    @objc func updateTxtView( notification:Notification){
        let userInfo = notification.userInfo!
        let keyboardEndFrameCoordinates = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardEndFrame = self.view.convert(keyboardEndFrameCoordinates, to: view.window)
        
        if notification.name == Notification.Name.UIKeyboardWillHide{
            textView.contentInset = UIEdgeInsets.zero
            
        }
        else{
            textView.contentInset = UIEdgeInsets(top:0, left:0, bottom: keyboardEndFrame.height, right:0)
            textView.scrollIndicatorInsets = textView.contentInset
        }
        
        textView.scrollRangeToVisible(textView.selectedRange)
    }
}

