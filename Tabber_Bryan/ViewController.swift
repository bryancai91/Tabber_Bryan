//
//  ViewController.swift
//  Tabber_Bryan
//
//  Created by Bryan Cai on 12/28/15.
//  Copyright © 2015 Bryan Cai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tipArray = [Double](count: 3, repeatedValue: 0.0)
    var highlighted : Int = 0
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipController: UISegmentedControl!
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var tipWordLabel: UILabel!
    @IBOutlet weak var totalWordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load on Main")
        let appDomain = NSBundle.mainBundle().bundleIdentifier!
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain)
        
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Tip Calculator"
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        tipLabel.alpha = 0
        totalLabel.alpha = 0
        tipWordLabel.alpha = 0
        totalWordLabel.alpha = 0
        
        billTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("View will appear on Main")
        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultSelected : Int? = defaults.integerForKey("defaultSelected")
        if defaultSelected != nil {
            highlighted = defaultSelected!
        }
        
        if defaults.valueForKey("billValue") != nil {
            billTextField.text = String(defaults.integerForKey("billValue"))
        }
        
        if defaults.valueForKey("tipOne") == nil {
            tipArray[0] = 0.18
        } else {
            tipArray[0] = defaults.doubleForKey("tipOne")
        }
        
        if defaults.valueForKey("tipTwo") == nil {
            tipArray[1] = 0.20
        } else {
            tipArray[1] = defaults.doubleForKey("tipTwo")
        }
        
        if defaults.valueForKey("tipThree") == nil {
            tipArray[2] = 0.22
        } else {
            tipArray[2] = defaults.doubleForKey("tipThree")
        }
        
        for (index, percentage) in tipArray.enumerate() {
            tipController.setTitle(String(format: "%.1f%%", percentage*100), forSegmentAtIndex: index)
        }
        
        tipController.selectedSegmentIndex = highlighted
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func viewTapGesture(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
//    
//        let defaults = NSUserDefaults.standardUserDefaults()
//        let tipOne = defaults.doubleForKey("tipOne")
//        let tipTwo = defaults.doubleForKey("tipTwo")
//        let tipThree = defaults.doubleForKey("tipThree")
//        let tipPercentages = [tipOne, tipTwo, tipThree]
        
        let tipPercentage = tipArray[tipController.selectedSegmentIndex]
        let billAmount = Double(billTextField.text!)
        
        var tip = 0.0
        var total = 0.0
        if let tryBill = billAmount {
            tip =  tryBill * tipPercentage
            total = tryBill + tip
        }
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        UIView.animateWithDuration(0.7, animations: {
            // This causes first view to fade in and second view to fade out
            self.tipLabel.alpha = 1
            self.totalLabel.alpha = 1
            self.tipWordLabel.alpha = 1
            self.totalWordLabel.alpha = 1
            self.billLabel.alpha = 0
        })
        billLabel.hidden = true
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        
        if billTextField.text != "" {
            print(billTextField.text)
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setInteger(Int(billTextField.text!)!, forKey: "billValue")
        }
        
    }
}

