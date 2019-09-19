//
//  ViewController.swift
//  calculator
//
//  Created by Andrej Krstevski on 9/19/19.
//  Copyright © 2019 Andrej Krstevski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var previousNumber:Double = 0;
    var numberOnScreen:Double = 0;
    var performingMath = false;
    var operation = 0;
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true
        {
            Label.text = String(sender.tag - 1)
            numberOnScreen = Double(Label.text!)!
            performingMath = false
        }
        else
        {
            Label.text = String(sender.tag - 1)
            numberOnScreen = Double(Label.text!)!
            
        }
        Label.text = Label.text! + String(sender.tag - 1)
        numberOnScreen = Double(Label.text!)!
        
    }
    
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if Label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(Label.text!)!
            if sender.tag  == 12 //divide
            {
                 Label.text = "/";            }
            else if sender.tag  == 13 //multiply
            {
                 Label.text = "x";            }
            else if sender.tag  == 14 //minus
            {
                 Label.text = "-";            }
            else if sender.tag  == 15 //plus
            {
                Label.text = "+";
            }
            
            operation = sender.tag
            performingMath = true;
        }
        
        else if sender.tag == 16
        {
            if operation == 12
            {
                
            }
            else if operation == 13
            {
                
            }
            else if operation == 14
            {
                
            }
           else  if operation == 15
            {
                
            }
        }
    }
    
    
    @IBOutlet weak var Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

