//
//  ViewController.swift
//  Tip
//
//  Created by Loren on 8/24/14.
//  Copyright (c) 2014 Loren Heiman. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billTextLabel: UILabel!
    @IBOutlet weak var tipPercentageTextLabel: UILabel!
    @IBOutlet weak var tipTextLabel: UILabel!
    @IBOutlet weak var totalTextLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        
        
        billField.font = UIFont(name:"Signika-Light", size: 50)
        tipLabel.font = UIFont(name:"Signika-Regular", size: 38)
        totalLabel.font = UIFont(name:"Signika-Regular", size: 38)
        
        billTextLabel.font = UIFont(name:"Signika-Light", size: 18)
        tipPercentageTextLabel.font = UIFont(name:"Signika-Light", size: 18)
        tipTextLabel.font = UIFont(name:"Signika-Light", size: 18)
        totalTextLabel.font = UIFont(name:"Signika-Light", size: 18)

        
        self.billField.alpha = 0
        self.billTextLabel.alpha = 0
        
        self.tipControl.alpha = 0
        self.tipLabel.alpha = 0
        self.totalLabel.alpha = 0
        self.tipPercentageTextLabel.alpha = 0
        self.tipTextLabel.alpha = 0
        self.totalTextLabel.alpha = 0
        
        billField.becomeFirstResponder()
        
        
        
        


        UIView.animateWithDuration(0.5, animations: {
            // This causes first view to fade in and second view to fade out
            self.billField.alpha = 1
            self.billTextLabel.alpha = 1
            })
        
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    

    @IBAction func onEditingChanged(sender: AnyObject) {
    
        var tipPercentages = [0.15, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
       
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = tip + billAmount
        
        total = round(total)
        tip = total - billAmount
    
        
    
        tipLabel.text = "\(tip)"
        totalLabel.text = "\(total)"
        
        tipLabel.text = String(format: "%.2f" , tip)
        totalLabel.text = String(format: "%.2f", total)
        
        self.tipLabel.alpha = 0
        self.totalLabel.alpha = 0
        
        
        UIView.animateWithDuration(0.4, animations: {
            self.tipControl.alpha = 1
            self.tipPercentageTextLabel.alpha = 1
            self.tipTextLabel.alpha = 1
            self.totalTextLabel.alpha = 1
            self.tipLabel.alpha = 1
            self.totalLabel.alpha = 1
            
            
        })

    }

    @IBAction func tipChanged(sender: AnyObject) {
        
        self.tipLabel.alpha = 0
        self.totalLabel.alpha = 0
        
       UIView.animateWithDuration(0.4, animations: {
        self.tipLabel.alpha = 1
        self.totalLabel.alpha = 1
        })
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
      view.endEditing(true)
    }
    
    
}



