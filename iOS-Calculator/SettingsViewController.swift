//
//  SettingsViewController.swift
//  iOS-Calculator
//
//  Created by Obatola Seward-Evans on 5/26/16.
//  Copyright © 2016 Obatola Seward-Evans. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var statusBarBlock: UIView!
    
    override func viewDidLoad() {
        let backgroundColor = UIColor.numericButtonColor()
        let statusBlockColor = UIColor(netHex: 0x151515)
        let navColor = UIColor.blackColor()
        let textColor = UIColor.textColor()
        
        super.viewDidLoad()

        statusBarBlock.backgroundColor = statusBlockColor
        navBar.tintColor = textColor
        navBar.barTintColor = navColor
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.textColor()]
        self.view.backgroundColor = backgroundColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func settingsModalDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
