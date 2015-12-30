//
//  SettingsViewController.swift
//  Tabber_Bryan
//
//  Created by Bryan Cai on 12/29/15.
//  Copyright © 2015 Bryan Cai. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipBar: UISegmentedControl!
    @IBOutlet weak var tipSettingOne: UITextField!
    @IBOutlet weak var tipSettingTwo: UITextField!
    @IBOutlet weak var tipSettingThree: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tipBar.selectedSegmentIndex = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")

        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultSelected : Int? = defaults.integerForKey("defaultSelected")
        if defaultSelected == nil {
            tipBar.selectedSegmentIndex = 0
        } else {
            tipBar.selectedSegmentIndex = defaultSelected!
        }
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        
        
        defaults.synchronize()
    
    }
    
    @IBAction func choosingDefault(sender: AnyObject) {
        print("func")
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipBar.selectedSegmentIndex, forKey: "defaultSelected")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
