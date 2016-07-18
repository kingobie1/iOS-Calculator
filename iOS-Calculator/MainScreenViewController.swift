//
//  MainScreenViewController.swift
//  iOS-Calculator
//
//  Created by Obatola Seward-Evans on 5/24/16.
//  Copyright © 2016 Obatola Seward-Evans. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet private weak var calculatorDisplay: UILabel!
    
    private var settings: Settings = Settings.init(colorTheme: ColorTheme.Dark)!
    private var colorManager = ColorManager.sharedInstance

    private var isFirstTime = true
    private var firstNumber = 0.0
    private var operation = ""
    private var isUserTypingNumber = false
    
    private var brain = CalculatorBrain()
    
    /* All Buttons: */
    @IBOutlet private var calculatorButtons: [UIButton]!
    @IBOutlet private weak var equalsButton: UIButton!
    @IBOutlet private weak var menuButton: UIButton!
    
    /** Double value of calculatorDisplay.
     when I grab it will represent the calculatorDisplay as a double.
     when I set it, it will convert the set Double into a string. */
    private var displayValue: Double {
        /// get calculatorDisplay double value
        get {
            return Double(calculatorDisplay.text!)!
        }
        /// set calculatorDisplay value of the current double
        set {
            calculatorDisplay.text = String(newValue)
        }
    }

    // MARK: - View
    
    override func viewDidLoad() {
        if let savedSettings = loadSettings() {
            settings = savedSettings
            colorManager.setColorTheme(savedSettings.colorTheme)
            redrawButtons()
        }
        
        let backgroundColor = colorManager.getColor(ColorType.Background)
        let textColor = colorManager.getColor(ColorType.Text)
        let equalsButtonColor = colorManager.getColor(ColorType.EqualButton)
        let highlightColor = colorManager.getColor(ColorType.ButtonHighlight)
        
        super.viewDidLoad()
        
        // Set colors:
        self.view.backgroundColor = backgroundColor
        calculatorDisplay.textColor = textColor
        
        equalsButton.setBackgroundImage(Color.imageWithColor(equalsButtonColor), forState: UIControlState.Normal)
        equalsButton.setBackgroundImage(Color.imageWithColor(highlightColor), forState: UIControlState.Highlighted)
        equalsButton.setTitleColor(equalsButtonColor, forState: UIControlState.Normal)
        menuButton.backgroundColor = backgroundColor
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    // MARK: - Actions

    @IBAction private func numberTapped(sender: UIButton) {
        // Get number from button.
        let number = sender.currentTitle!
        
        print("digit \(number) pressed")
        
        if isUserTypingNumber {
            // Add number to calculator display
            calculatorDisplay.text = calculatorDisplay.text! + number
        } else {
            // New batch of numbers
            calculatorDisplay.text = number
        }
        
        isUserTypingNumber = true
    }
    
    @IBAction private func performOperation(sender: UIButton) {
        if isUserTypingNumber {
            brain.setOperand(displayValue)
            isUserTypingNumber = false
        }
        
        if let mathmaticalSymbol = sender.currentTitle {
            brain.performOperation(mathmaticalSymbol)
        }
        
        displayValue = brain.result
    }
    
    @IBAction func unwindToMainScreen(sender: UIStoryboardSegue) {
        
        // When comming back from the settings.
        if sender.sourceViewController is SettingsViewController {
            print("updating ui")
            updateUI()
        }
    }
    
    
    // MARK: - Helper functions
    
//    /// Reset current calculator state.
//    private func reset() {
//        calculatorDisplay.text = ""
//        isUserTypingNumber = false
//        isFirstTime = true
//        firstNumber = 0.0
//    }

    /// Redraw your labels, update your UIElements, do what you have to do
    private func updateUI() {
        viewDidLoad()
        redrawButtons()
    }
    
    /// Redraw all 5 rows of buttons
    private func redrawButtons() {
        for button: UIButton in calculatorButtons {
            button.setNeedsDisplay()
        }
    }
    
    func saveSettings() {
        
        settings.colorTheme = colorManager.getCurrentColorTheme()
        
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(settings, toFile: Settings.ArchiveURL.path!)
        
        if !isSuccessfulSave {
            print("Failed to save settings")
        }
    }
    
    func loadSettings() -> Settings? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Settings.ArchiveURL.path!) as? Settings
    }
}

