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

//    @IBAction func arithmeticTapped(sender: UIButton) {
//        // User has clicked an arathmetic button: (+ - x ÷).
//        isUserTypingNumber = false
//        
//        if isFirstTime {
//            operation = sender.currentTitle!
//            firstNumber = getDouble()
//            isFirstTime = false
//        } else {
//            calculate()
//            operation = sender.currentTitle!
//        }
//    }
//    
//    @IBAction func clearTapped(sender: UIButton) {
//        // Clear the calculator screen.
//        reset()
//    }
//
//    @IBAction func equalsTapped(sender: UIButton) {
//        
//        // Do nothing if the screen does not contain any numbers.
//        if !containsNumbers() { return }
//        
//        // User has clicked the equals button.
//        isUserTypingNumber = false
//        
//        calculate()
//        
//        isFirstTime = true
//        
//        setDouble(firstNumber)
//    }
//    
//    @IBAction func decimalTapped(sender: AnyObject) {
//        if calculatorDisplay.text!.rangeOfString(".") != nil && !isUserTypingNumber {
//            // Do nothing if there is already a decimal.
//            return
//        }
//        
//        if calculatorDisplay.text!.isEmpty {
//            calculatorDisplay.text = "0."
//        } else {
//            calculatorDisplay.text = calculatorDisplay.text! + "."
//        }
//    }
//    
//    @IBAction func posNegTapped(sender: UIButton) {
//        // Switch between positive and negative value.
//        
//        isUserTypingNumber = true
//        
//        // Do noemptything if the screen is .
//        if calculatorDisplay.text!.isEmpty {
//            calculatorDisplay.text = "-"
//            return
//        }
//        
//        let tempString: String = calculatorDisplay.text!
//        
//        if tempString.containsString("-") {
//            // Set positive.
//            calculatorDisplay.text = (tempString as NSString).substringFromIndex(1)
//        } else {
//            // Set negative.
//            calculatorDisplay.text = "-" + tempString
//        }
//    }
//    
//    @IBAction func percentageTapped(sender: AnyObject) {
//        
//        var double: Double
//        
//        // Do nothing if the screen does not contain any numbers.
//        if !containsNumbers() { return }
//        
//        double = getDouble() / 100
//        
//        setDouble(double)
//    }
    
    
    @IBAction func unwindToMainScreen(sender: UIStoryboardSegue) {
        
        // When comming back from the settings.
        if sender.sourceViewController is SettingsViewController {
            updateUI()
        }
    }
    
    
    // MARK: - Helper functions
    
//    private func calculate() {
//        var results = 0.0
//        
//        let secondNumber = getDouble()
//        
//        switch operation {
//        case "+":
//            results = firstNumber + secondNumber
//        case "-":
//            results = firstNumber - secondNumber
//        case "x":
//            results = firstNumber * secondNumber
//        case "÷":
//            results = firstNumber / secondNumber
//        default:
//            break
//        }
//        
//        print(firstNumber, operation, secondNumber, " = ", results)
//        
//        if results.isFinite {
//            setDouble(results)
//        } else {
//            results = 0
//            calculatorDisplay.text = ""
//        }
//        
//        firstNumber = results
//    }
//    
//    /// Returns true if calculatorDisplay contains any numbers.
//    private func containsNumbers() -> Bool {
//        
//        let decimalCharacters = NSCharacterSet.decimalDigitCharacterSet()
//        let decimalRange = calculatorDisplay.text!.rangeOfCharacterFromSet(decimalCharacters, options: NSStringCompareOptions(), range: nil)
//        
//        if decimalRange == nil {
//            return false
//        }
//        
//        return true
//    }
//    
//    /// Get the double value displayed on the calculatorDisplay.
//    private func getDouble() -> Double {
//        
//        if calculatorDisplay.text!.isEmpty {
//            return 0
//        } else {
//            return Double(calculatorDisplay.text!)!
//        }
//    }
//    
//    /// Set the calculatorDisplay text to the given double.
//    private func setDouble(double: Double) {
//        
//        calculatorDisplay.text = String(double)
//    }
//    
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

