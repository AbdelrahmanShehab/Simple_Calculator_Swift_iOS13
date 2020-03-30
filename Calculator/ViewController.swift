//
//  ViewController.swift
//  Calculator
//
//  Created by Abdelrahman Shehab on 3/7/20.
//  Copyright © 2020 Abdelrahman Shehab. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var operation = 0
    var performinmgMath = false
    var SavedData = ""
    var filePath = "/Users/iShehab/Desktop/CalculatorResult/output.txt"

    
    @IBOutlet weak var NumberShow: UILabel!
    
    @IBAction func Numbers(_ sender: UIButton) {
        
        if performinmgMath == true{
            NumberShow.text = String(sender.tag-1)
            numberOnScreen = Double(NumberShow.text!)!
            performinmgMath = false
            
        }
        else {
            NumberShow.text = NumberShow.text! + String(sender.tag - 1 )
            numberOnScreen = Double(NumberShow.text!)!
        }

    }
    
    @IBAction func OperationBtn(_ sender: UIButton) {
        if NumberShow.text != "" && sender.tag != 11 && sender.tag != 16 {
            previousNumber = Double(NumberShow.text!)!
            
            if sender.tag == 12{ // DIVIDE
                NumberShow.text = "/"
            }
            else if sender.tag == 13{ // Multiply
                NumberShow.text = "*"

            }
            else if sender.tag == 14{ // Minus
                NumberShow.text = "-"

            }
            else if sender.tag == 15{ // Plus
                NumberShow.text = "+"
            }

            operation = sender.tag
            performinmgMath = true
        }
      else if sender.tag == 16 {
            if operation == 12 {
                NumberShow.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13{
                NumberShow.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14 {
                NumberShow.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15 {
                NumberShow.text = String(previousNumber + numberOnScreen)
            }
  
//            Saving In Text File
            
            SavedData = NumberShow.text!
               do {
                try SavedData.write(toFile: filePath, atomically: false, encoding: String.Encoding.utf8)
               }
               catch let error as NSError {
                   print("An error took place: \(error)")
                   }

    }

    else if sender.tag == 11 {
            NumberShow.text = ""
            numberOnScreen = 0
            previousNumber = 0
            operation = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

