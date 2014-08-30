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
    @IBOutlet weak var roundSwitch: UISwitch!
    

                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     //   tipLabel.text="0.00"
       // totalLabel.text="0.00"
      //  roundSwitch.on = false
        
        billField.becomeFirstResponder()
     
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        
        var billAmount = NSString(string: billField.text).doubleValue
    
        var tip = billAmount * tipPercentage
        var total = tip + billAmount
        
    
        tipLabel.text = "\(tip)"
        totalLabel.text = "\(total)"
        

        
     //   if roundSwitch.on == true {
            total = round(total)
            tip = total - billAmount
          //  println("rounded!")
      //  }
      
        
        tipLabel.text = String(format: "%.2f" , tip)
        totalLabel.text = String(format: "%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

