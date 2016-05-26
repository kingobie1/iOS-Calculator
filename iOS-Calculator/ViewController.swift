//
//  ViewController.swift
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
    
    var isTypingNumber = false
    var isFirstTime = true
    var firstNumber = 0.0
    var operation = ""

    override func viewDidLoad() {
        let backgroundColor = UIColor.backgroundColor()
        let textColor = UIColor.textColor()
        let equalsButtonColor = UIColor.equalButtonColor()
        
        super.viewDidLoad()
        
        // Set colors:
        self.view.backgroundColor = backgroundColor
<<<<<<< HEAD
=======
        
>>>>>>> Correct-UI-Size
        calculatorDisplay.textColor = textColor
        equalsButton.backgroundColor = equalsButtonColor
        equalsButton.setTitleColor(equalsButtonColor, forState: UIControlState.Normal)        
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
}

