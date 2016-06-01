//
//  MainScreenViewController.swift
//  iOS-Calculator
//
//  Created by Obatola Seward-Evans on 5/24/16.
//  Copyright © 2016 Obatola Seward-Evans. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    // MARK: Properties
    
    var settings: Settings
    
    @IBOutlet weak var calculatorDisplay: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    
    var colorManager = ColorManager.sharedInstance
    
    var isTypingNumber = false
    var isFirstTime = true
    var firstNumber = 0.0
    var operation = ""
    
    /* All Buttons: */
    @IBOutlet weak var acButton: ArithmeticButton!
    @IBOutlet weak var posNegButton: ArithmeticButton!
    @IBOutlet weak var percentageButton: ArithmeticButton!
    @IBOutlet weak var divisionButton: ArithmeticButton!
    
    @IBOutlet weak var sevenButton: NumericalButton!
    @IBOutlet weak var eightButton: NumericalButton!
    @IBOutlet weak var nineButton: NumericalButton!
    @IBOutlet weak var multiplyButton: ArithmeticButton!
    
    @IBOutlet weak var fourButton: NumericalButton!
    @IBOutlet weak var fiveButton: NumericalButton!
    @IBOutlet weak var sixButton: NumericalButton!
    @IBOutlet weak var minusButton: ArithmeticButton!
    
    @IBOutlet weak var oneButton: NumericalButton!
    @IBOutlet weak var twoButton: NumericalButton!
    @IBOutlet weak var threeButton: NumericalButton!
    @IBOutlet weak var plusButton: ArithmeticButton!
    
    @IBOutlet weak var decimalButton: NumericalButton!
    @IBOutlet weak var zeroButton: NumericalButton!
    @IBOutlet weak var equalsButton: UIButton!

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
    
    required init?(coder aDecoder: NSCoder) {
        
        // Load default settings.
        self.settings = Settings.init(colorTheme: ColorTheme.Dark)!
        
        super.init(coder: aDecoder)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    // MARK: Actions

    @IBAction func numberTapped(sender: UIButton) {
        // Get number from button.
        let number = sender.currentTitle
        
        if isTypingNumber {
            // Add number to calculator display
            calculatorDisplay.text = calculatorDisplay.text! + number!
        } else {
            // New batch of numbers
            calculatorDisplay.text = number!
            isTypingNumber = true
        }
    }

    @IBAction func arithmeticTapped(sender: UIButton) {
        // User has clicked an arathmetic button: (+ - x ÷).
        isTypingNumber = false
        
        if isFirstTime {
            operation = sender.currentTitle!
            firstNumber = getDouble()
            isFirstTime = false
        } else {
            calculate()
            operation = sender.currentTitle!
        }
    }
    
    @IBAction func clearTapped(sender: UIButton) {
        // Clear the calculator screen.
        reset()
    }

    @IBAction func equalsTapped(sender: UIButton) {
        
        // Do nothing if the screen does not contain any numbers.
        if !containsNumbers() { return }
        
        // User has clicked the equals button.
        isTypingNumber = false
        
        calculate()
        
        isFirstTime = true
        
        setDouble(firstNumber)
    }
    
    @IBAction func decimalTapped(sender: AnyObject) {
        if calculatorDisplay.text!.rangeOfString(".") != nil && !isTypingNumber {
            // Do nothing if there is already a decimal.
            return
        }
        
        if calculatorDisplay.text!.isEmpty {
            calculatorDisplay.text = "0."
        } else {
            calculatorDisplay.text = calculatorDisplay.text! + "."
        }
    }
    
    @IBAction func posNegTapped(sender: UIButton) {
        // Switch between positive and negative value.
        
        isTypingNumber = true
        
        // Do noemptything if the screen is .
        if calculatorDisplay.text!.isEmpty {
            calculatorDisplay.text = "-"
            return
        }
        
        let tempString: String = calculatorDisplay.text!
        
        if tempString.containsString("-") {
            // Set positive.
            calculatorDisplay.text = (tempString as NSString).substringFromIndex(1)
        } else {
            // Set negative.
            calculatorDisplay.text = "-" + tempString
        }
    }
    
    @IBAction func percentageTapped(sender: AnyObject) {
        
        var double: Double
        
        // Do nothing if the screen does not contain any numbers.
        if !containsNumbers() { return }
        
        double = getDouble() / 100
        
        setDouble(double)
    }
    
    
    @IBAction func unwindToMainScreen(sender: UIStoryboardSegue) {
        
        // When comming back from the settings.
        if sender.sourceViewController is SettingsViewController {
            updateUI()
        }
    }
    
    
    // MARK: Helper functions
    
    private func calculate() {
        var results = 0.0
        
        let secondNumber = getDouble()
        
        switch operation {
        case "+":
            results = firstNumber + secondNumber
        case "-":
            results = firstNumber - secondNumber
        case "x":
            results = firstNumber * secondNumber
        case "÷":
            results = firstNumber / secondNumber
        default:
            break
        }
        
        print(firstNumber, operation, secondNumber, " = ", results)
        
        if results.isFinite {
            setDouble(results)
        } else {
            results = 0
            calculatorDisplay.text = ""
        }
        
        firstNumber = results
    }
    
    /// Returns true if calculatorDisplay contains any numbers.
    private func containsNumbers() -> Bool {
        
        let decimalCharacters = NSCharacterSet.decimalDigitCharacterSet()
        let decimalRange = calculatorDisplay.text!.rangeOfCharacterFromSet(decimalCharacters, options: NSStringCompareOptions(), range: nil)
        
        if decimalRange == nil {
            return false
        }
        
        return true
    }
    
    /// Get the double value displayed on the calculatorDisplay.
    private func getDouble() -> Double {
        
        if calculatorDisplay.text!.isEmpty {
            return 0
        } else {
            return Double(calculatorDisplay.text!)!
        }
    }
    
    /// Set the calculatorDisplay text to the given double.
    private func setDouble(double: Double) {
        
        calculatorDisplay.text = String(double)
    }
    
    /// Reset current calculator state.
    private func reset() {
        calculatorDisplay.text = ""
        isTypingNumber = false
        isFirstTime = true
        firstNumber = 0.0
    }

    /// Redraw your labels, update your UIElements, do what you have to do
    private func updateUI() {
        viewDidLoad()
        redrawButtons()
    }
    
    /// Redraw all 5 rows of buttons
    private func redrawButtons() {
        
        //        let arrayButtons: [UIButton] = [acButton, posNegButton, percentageButton, divisionButton,
        //                                        sevenButton, eightButton, nineButton, multiplyButton,
        //                                        fourButton, fiveButton, sixButton, minusButton,
        //                                        oneButton, twoButton, threeButton, plusButton,
        //                                        decimalButton, zeroButton, equalsButton]
        var arrayButtons = [UIButton]()
        
        arrayButtons.append(acButton)
        arrayButtons.append(posNegButton)
        arrayButtons.append(percentageButton)
        arrayButtons.append(divisionButton)
        arrayButtons.append(sevenButton)
        arrayButtons.append(eightButton)
        arrayButtons.append(nineButton)
        arrayButtons.append(multiplyButton)
        arrayButtons.append(fourButton)
        arrayButtons.append(fiveButton)
        arrayButtons.append(sixButton)
        arrayButtons.append(minusButton)
        arrayButtons.append(oneButton)
        arrayButtons.append(twoButton)
        arrayButtons.append(threeButton)
        arrayButtons.append(plusButton)
        arrayButtons.append(decimalButton)
        arrayButtons.append(zeroButton)
        arrayButtons.append(equalsButton)
        
        for button: UIButton in arrayButtons {
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

