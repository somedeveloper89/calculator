//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let numbersArray = [0,1,2,3,4,5,6,7,8,9]
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber = true
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        print("non-number button is pressed")
        isFinishedTypingNumber = true
        
        guard let number = Double(displayLabel.text!) else {fatalError("Cannot convert displaylabel text to double")}
        
        if let tagValue = sender.currentTitle {
            switch(tagValue) {
            case "AC":
                displayLabel.text = String(Int(number * 0))
            case "+/-":
                displayLabel.text = String(number * -1)
            case "%":
                displayLabel.text = String(number/100)
            case "÷":
                print("÷")
            case "x":
                print("x")
                
            case "-":
                print("-")
                
            case "+":
                print("+")
                
            case "=":
                print("=")
            default:
                print("default")
            }
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            }
            else {
                if numValue == "." {
                    guard let number = Double(displayLabel.text!) else {fatalError("Cannot convert displaylabel text to double")}

                    let isInt = floor(number) == number
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
    }
    
}

