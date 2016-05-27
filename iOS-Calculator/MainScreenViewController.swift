//
//  MainScreenViewController.swift
//  iOS-Calculator
//
//  Created by Obatola Seward-Evans on 5/24/16.
//  Copyright © 2016 Obatola Seward-Evans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var calculatorDisplay: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    
    var colorManager = ColorManager.sharedInstance
    
    var isTypingNumber = false
    var isFirstTime = true
    var firstNumber = 0.0
    var operation = ""
    
    /* All Buttons: */
    @IBOutlet weak var acButton: ArithmeticButton!
    @IBOutlet weak var leftSemiButton: ArithmeticButton!
    @IBOutlet weak var rightSemiButton: ArithmeticButton!
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
        let backgroundColor = colorManager.getColor(ColorType.Background)
        let textColor = colorManager.getColor(ColorType.Text)
        let equalsButtonColor = colorManager.getColor(ColorType.EqualButton)
        
        super.viewDidLoad()
        
        // Set colors:
        self.view.backgroundColor = backgroundColor
        calculatorDisplay.textColor = textColor
        equalsButton.backgroundColor = equalsButtonColor
        equalsButton.setTitleColor(equalsButtonColor, forState: UIControlState.Normal)
        menuButton.backgroundColor = backgroundColor
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
            firstNumber = Double(calculatorDisplay.text!)!
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
        // User has clicked the equals button.
        isTypingNumber = false
        
        calculate()
        
        isFirstTime = true
        
        calculatorDisplay.text = String(firstNumber)
    }
    
    @IBAction func decimalTapped(sender: AnyObject) {
        // TODO: Remove
        updateUI()
        
        if calculatorDisplay.text!.rangeOfString(".") != nil {
            // Do nothing if there is already a decimal
            return
        }
        
        if !calculatorDisplay.text!.isEmpty {
            calculatorDisplay.text = calculatorDisplay.text! + "."
        }
    }
    
    
    // MARK: Helper functions
    
    func calculate() {
        var results = 0.0
        let secondNumber = Double(calculatorDisplay.text!)!
        
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
        
        calculatorDisplay.text = String(results)
        firstNumber = results
    }
    
    func reset() {
        calculatorDisplay.text = ""
        isTypingNumber = false
        isFirstTime = true
        firstNumber = 0.0
    }
    
    func updateUI() {
        // Redraw your labels, update your UIElements, do what you have to do
        viewDidLoad()
        redrawButtons()
    }
    
    func redrawButtons() {
        // Redraw all 5 rows of buttons
        
        //        let arrayButtons: [UIButton] = [acButton, leftSemiButton, rightSemiButton, divisionButton,
        //                                        sevenButton, eightButton, nineButton, multiplyButton,
        //                                        fourButton, fiveButton, sixButton, minusButton,
        //                                        oneButton, twoButton, threeButton, plusButton,
        //                                        decimalButton, zeroButton, equalsButton]
        var arrayButtons = [UIButton]()
        
        arrayButtons.append(acButton)
        arrayButtons.append(leftSemiButton)
        arrayButtons.append(rightSemiButton)
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
}

