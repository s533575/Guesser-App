//
//  FirstViewController.swift
//  Guesser App
//
//  Created by Mothe,Pranathi on 2/27/19.
//  Copyright © 2019 Northwest Missouri state university. All rights reserved.
//

import UIKit

class GuesserViewController: UIViewController {
    
    
    @IBOutlet weak var myguess: UITextField!

    @IBOutlet weak var feedback: UILabel!
    
    @IBOutlet weak var amiright: UIButton!
    
    
    @IBOutlet weak var newproblem: UIButton!
    
    
    @IBAction func amIRight(_ sender: Any) {
        let Guess = Guesser.shared
        if let guessValue = Int(myguess.text!)
        {
            if guessValue < 1
            {
               feedback.text = "Invalid Number"
            }
            else if guessValue > 10
            {
               feedback.text = "Invalid Number"
            }
            else
            {
                let output = Guess.amIRight(guess: guessValue)
                if(output == "Correct")
                {
                    feedback.text = "\(output)"
                    displayMessage()
                    Guess.createNewProblem()
                   
                }else{
                    feedback.text = "\(output)"
                }
            }
        }
        else
        {
            feedback.text = "Invalid Number"
        }
    }
    
    @IBAction func creatNewProblem(_ sender: Any) {
        myguess.text = ""
        feedback.text = ""

        let guess = Guesser.shared
        guess.createNewProblem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let guess = Guesser.shared
        guess.createNewProblem()
        
    }
    func displayMessage(){
        let guess = Guesser.shared
        let alert = UIAlertController(title: "Well done",
                                      message: "You got it in \(guess.numAttemps) tries",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }


}

