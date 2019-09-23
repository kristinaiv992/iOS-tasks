//
//  ViewController.swift
//  calculator
//
//  Created by Andrej Krstevski on 9/19/19.
//  Copyright © 2019 Andrej Krstevski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //we need to store the first number in order to "+"/"-"/"x"/"/"/ the previous number with our next number : 22 + 44 , 22 is stored in previous number
    var previousNumber:Double = 0;
    var numberOnScreen:Double = 0;
    //performing Math will be true whether I click + or - Or X or /
    var performingMath = false;
    var operation = 0;
    
    @IBAction func numbers(_ sender: UIButton)
    {
        //when user starts typing a new number again , we are checking if performing math is true
        //because if it is we need to reset label.text
        if performingMath == true
        {
            //ova e koga gi stiskame brojkite, e sega posle stiskanjeto na + ili - itn treba da se
            //resetira skreenot, pa taka na skrinot go zadavame toj broj sto se stiska
            
            Label.text = String(sender.tag - 1)
            //ko konvertirame toj broj sto sme go stisnale vo double bidejki sega e vo string format
            //i go zapisuvame vo numberOnScreen
            numberOnScreen = Double(Label.text!)!
            performingMath = false
        }
        else
            //ova e procesot koga vekje sme dodale + ili - itn i go pisuvame noviot broj
            //sto sakame da go dodademe
        {
            Label.text = Label.text! + String(sender.tag - 1)
            numberOnScreen = Double(Label.text!)!
        }
        
        
    }
    
    
    @IBAction func buttons(_ sender: UIButton)
    {
        //label.text != "" means that there is a number , sender.tag is not a reset buton 11 and sender.tag is not an equal button
        
        
        if Label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            //we are storing our previous number here
            previousNumber = Double(Label.text!)!
            if sender.tag  == 12 //divide
            {
                 Label.text = "/";
                
            }
            else if sender.tag  == 13 //multiply
            {
                 Label.text = "x";
                
            }
            else if sender.tag  == 14 //minus
            {
                Label.text = "-";
                
            }
            else if sender.tag  == 15 //plus
            {
                Label.text = "+";
            }
            
            operation = sender.tag
            //performing math is true when we click "+"/"-"/"x" or /"/"/
            performingMath = true;
        }
        
        else if sender.tag == 16
        {
            if operation == 12
            {
                Label.text = String(previousNumber / numberOnScreen)            }
            else if operation == 13
            {
                Label.text = String(previousNumber * numberOnScreen)            }
            else if operation == 14
            {
                Label.text = String(previousNumber - numberOnScreen)            }
           else  if operation == 15
            {
                Label.text = String(previousNumber + numberOnScreen)
            }
        }
        else if sender.tag == 11
        {
            Label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
            
        }
    }
    
    
    @IBOutlet weak var Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

