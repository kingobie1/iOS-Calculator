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
    @IBOutlet weak var changeThemeButton: UIButton!
    
    var colorManager = ColorManager.sharedInstance
    
    override func viewDidLoad() {
        let backgroundColor = colorManager.getColor(ColorType.Background)
        let statusBlockColor = colorManager.getColor(ColorType.StatusBarBlock)
        let navColor = colorManager.getColor(ColorType.Default)
        let textColor = colorManager.getColor(ColorType.Text)
//        let buttonColor = colorManager.getColor(ColorType.ArithmeticButton)
        
        super.viewDidLoad()

        changeThemeButton.setTitleColor(textColor, forState: UIControlState.Normal)
        statusBarBlock.backgroundColor = statusBlockColor
        navBar.tintColor = textColor
        navBar.barTintColor = navColor
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: textColor]
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
    
    @IBAction func changeColorTheme(sender: AnyObject) {
        colorManager.switchColorTheme()
        viewDidLoad()
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
