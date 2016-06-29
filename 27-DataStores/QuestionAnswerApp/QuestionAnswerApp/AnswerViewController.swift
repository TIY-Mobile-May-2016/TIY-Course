//
//  AnswerViewController.swift
//  QuestionAnswerApp
//
//  Created by Taylor Frost on 6/27/16.
//  Copyright © 2016 Taylor Frost. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    var passedQuestion : Question?
    
    var randomNumber : UInt32 = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("viewDidLoad")
        
        self.randomNumber = arc4random_uniform(4) + 1
        
        print("The randomNumber is \(self.randomNumber)")
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //print("viewWillAppear")
        
        self.questionLabel.text = passedQuestion?.questionString
        
        self.setupButtons()
        
    }
    
    func setupButtons() {
        
        self.buttonOne.setTitle("Answer 1", forState: .Normal)
        self.buttonTwo.setTitle("Answer 2", forState: .Normal)
        self.buttonThree.setTitle("Answer 3", forState: .Normal)
        self.buttonFour.setTitle("Answer 4", forState: .Normal)
        
        
        switch(randomNumber) {
            case 1: self.buttonOne.setTitle(passedQuestion?.answerString, forState: .Normal)
            case 2: self.buttonTwo.setTitle(passedQuestion?.answerString, forState: .Normal)
            case 3: self.buttonThree.setTitle(passedQuestion?.answerString, forState: .Normal)
            default: self.buttonFour.setTitle(passedQuestion?.answerString, forState: .Normal)
        }
        
        
        if randomNumber == 1 {
            self.buttonOne.setTitle(passedQuestion?.answerString, forState: .Normal)
        } else if randomNumber == 2 {
            self.buttonTwo.setTitle(passedQuestion?.answerString, forState: .Normal)
        } else if randomNumber == 3 {
            self.buttonThree.setTitle(passedQuestion?.answerString, forState: .Normal)
        } else {
            self.buttonFour.setTitle(passedQuestion?.answerString, forState: .Normal)
        }
        
    }
    
    
    // Displays an alert with a given title string
    // Helper Function
    
    
    func doAlert(title: String) {
        
        let alert = UIAlertController(title: title, message: title, preferredStyle: .Alert)
        
        
        let okAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        
        
        alert.addAction(okAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func buttonOneTapped(sender: UIButton) {
        
        print("ButtonOneTapped")
        
        if randomNumber == 1 {
            self.doAlert("Correct")
        } else {
            self.doAlert("InCorrect!")
        }

    }
    
    @IBAction func buttonTwoTapped(sender: UIButton) {
        print("ButtonTwoTapped")
        
        if randomNumber == 2{
            self.doAlert("Correct")
        } else {
            self.doAlert("InCorrect!")
        }
        
    }
    
    
    @IBAction func buttonThreeTapped(sender: UIButton) {
    
        print("ButtonThreeTapped")
        
        if randomNumber == 3 {
            self.doAlert("Correct")
        } else {
            self.doAlert("InCorrect!")
        }
     
    }
    
    
    @IBAction func buttonFourTapped(sender: UIButton) {
        print("ButtonFourTapped")
        
        if randomNumber == 4 {
            self.doAlert("Correct")
        } else {
            self.doAlert("InCorrect!")
        }
        
        
    }
    
    
    
    
}
    


    

