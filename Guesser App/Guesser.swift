//
//  Guesser.swift
//  Guesser App
//
//  Created by Mothe,Pranathi on 2/27/19.
//  Copyright © 2019 Northwest Missouri state university. All rights reserved.
//

import Foundation
class Guesser{
    static let shared = Guesser()
    
    private var correctAnswer : Int = 0
    private var _numAttempts : Int = 0
    private var guesses : [Guess] = []
    
    private init() {
        
    }
    
    var numAttemps : Int{
        return _numAttempts
    }
    
    func createNewProblem()
    {
        let Random = Int.random(in: 1...10);
        self.correctAnswer = Random
        self._numAttempts = 0
    }
    
    func amIRight(guess:Int) -> String
    {
        if guess != correctAnswer && guess < correctAnswer{
            _numAttempts = _numAttempts + 1
            return Result.tooLow.rawValue
        }
        else if guess != correctAnswer && guess > correctAnswer{
            _numAttempts = _numAttempts + 1
            return Result.tooHigh.rawValue
        }
        else
        {
            guesses.append(Guess(correctAnswer: correctAnswer, numAttemptsRequired: _numAttempts))
            return Result.correct.rawValue
        }
    }
    
    func guess(index:Int) -> Guess{
        print(guesses)
        return guesses[index]
    }
    
    func numGuesses() -> Int {
        return guesses.count
    }
    
    func minimumNumAttempts() -> Int
    {
        if guesses.count == 0
        {
           return 0
        }
        else
        {
        var minimum : Int = guesses[0].numAttemptsRequired
        for i in 0 ... guesses.count-1
        {
            if guesses[i].numAttemptsRequired < minimum
            {
                minimum = guesses[i].numAttemptsRequired
            }
        }
        return minimum
        }
    }
    
    func maximumNumAttempts() -> Int
    {
        if guesses.count == 0
        {
            return 0
        }
        else
        {
        var maximum : Int = guesses[0].numAttemptsRequired
        for i in 0 ... guesses.count-1
        {
            if guesses[i].numAttemptsRequired > maximum
            {
                maximum = guesses[i].numAttemptsRequired
            }
        }
        return maximum
        }
    }
    
    func calculateMean() -> Double{
        if guesses.count == 0
        {
            return 0
        }
        else
        {
        var avg : Double = 0.0
        for i in 0 ... guesses.count-1
        {
            avg = avg + Double(guesses[i].numAttemptsRequired)
        }
        return avg/Double(guesses.count)
        }
    }
    
    func calcStandardDeviation() -> Double
    {
        if guesses.count == 0
        {
            return 0
        }
        else
        {
        var stddev : Double = 0.0
        for i in 0 ... guesses.count-1
        {
            stddev = stddev + pow((Double(guesses[i].numAttemptsRequired) - calculateMean()),2)
        }
        return sqrt(stddev/Double(guesses.count))
        }
    }
    
    func clearStatistics(){
        guesses = []
    }
    
}

struct Guess{
    var correctAnswer : Int
    var numAttemptsRequired :Int
}

enum Result:String {case tooLow = "Too Low", tooHigh = "Too High", correct = "Correct"}

