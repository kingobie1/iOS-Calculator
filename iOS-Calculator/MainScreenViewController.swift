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
    @IBOutlet weak var equalsButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    
    var colorManager = ColorManager.sharedInstance
    
    var isTypingNumber = false
    var isFirstTime = true
    var firstNumber = 0.0
    var operation = ""
    
    /* All Buttons: */
    @IBOutlet weak var acButton: ArithmeticButton!
    @IBOutlet weak var leftSemiButton: ArithmeticButton!
    

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
    }
}

