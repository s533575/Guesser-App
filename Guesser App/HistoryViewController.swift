//
//  SecondViewController.swift
//  Guesser App
//
//  Created by Mothe,Pranathi on 2/27/19.
//  Copyright © 2019 Northwest Missouri state university. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let guesses = Guesser.shared
        return guesses.numGuesses()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let guess = Guesser.shared
        let cell = tableView.dequeueReusableCell(withIdentifier: "guesser")!
        cell.textLabel?.text = "Correct Answer: \(guess.guess(index:indexPath.row).correctAnswer) "
        cell.detailTextLabel?.text = "#Attempts: \(guess.guess(index: indexPath.row).numAttemptsRequired)"
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
 
    @IBOutlet weak var viewDetails: UITableView!
    override func viewDidAppear(_ animated: Bool) {
        self.viewDetails.reloadData()
    }


}

