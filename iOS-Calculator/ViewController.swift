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
    
    var isTypingNumber = false
    var firstNumber = 0.0
    var secondNumber = 0.0
    var operation = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        isTypingNumber = false
        
        firstNumber = Double(calculatorDisplay.text!)!
        
        operation = sender.currentTitle!
    }
    
    @IBAction func clearTapped(sender: UIButton) {
        // Clear the calculator screen.
        calculatorDisplay.text = ""
    }
    

    @IBAction func equalsTapped(sender: UIButton) {
        isTypingNumber = false
        var results = 0.0
        
        secondNumber = Double(calculatorDisplay.text!)!
        
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
        
        calculatorDisplay.text = String(results)
    }
}

