//
//  ViewController.swift
//  Tabber_Bryan
//
//  Created by Bryan Cai on 12/28/15.
//  Copyright © 2015 Bryan Cai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func viewTapGesture(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.25]
        let tipPercentage = tipPercentages[tipController.selectedSegmentIndex]
        let billAmount = Double(billTextField.text!)
        
        
        
        var tip = 0.0
        var total = 0.0
        if let tryBill = billAmount {
            tip =  tryBill * tipPercentage
            total = tryBill + tip
        }
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

        
    }

}

