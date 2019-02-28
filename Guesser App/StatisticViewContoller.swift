//
//  StatisticViewContoller.swift
//  Guesser App
//
//  Created by Mothe,Pranathi on 2/27/19.
//  Copyright © 2019 Northwest Missouri state university. All rights reserved.
//

import UIKit

class StatisticViewContoller: UIViewController {
    
    
    @IBOutlet weak var minimum: UITextField!
    
    
    @IBOutlet weak var maximum: UITextField!
    

    @IBOutlet weak var mean: UITextField!
    
    
    @IBOutlet weak var deviation: UITextField!
    
    
    @IBAction func clearStatistics(_ sender: Any) {
        let Guess = Guesser.shared
        minimum.text = ""
        maximum.text = ""
        mean.text = ""
        deviation.text = ""
        Guess.clearStatistics()
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let Guess = Guesser.shared
        minimum.text = "\(Guess.minimumNumAttempts())"
        maximum.text = "\(Guess.maximumNumAttempts())"
        mean.text = String(format : "%0.1f", (Guess.calculateMean()))
        deviation.text = String(format : "%0.1f",Guess.calcStandardDeviation())
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewDidLoad()
    }
    
}
