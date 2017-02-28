//
//  Game.swift
//  Hangman
//
//  Created by Adhyyan Narang on 2/26/17.
//  Copyright © 2017 Shawn D'Souza. All rights reserved.
//

import UIKit

class Game {
    
    var incorrectGuess: [Character] = []
    var correctGuess: [Character] = []
    var word: String!
    var progress: String = ""
    var numTries: Int = 0
    let totalTries: Int = 6
    var length: Int = 0
    
    //initializer
    init(word: String) {
        self.word = word
        self.length = word.characters.count
        for i in 0...(length - 1) {
            let index = word.index(word.startIndex, offsetBy: i)
            if word[index] == " " {
                progress.append(" ")
            } else {
            progress.append("_")
            }
        }
    }
    
    //make a guess
    func makeGuess(guess: Character) -> Void {
        //TODO: Check if the character has already been guessed.
        var there: Bool = false
        for i in 0...(length - 1) {
            let index = word.index(word.startIndex, offsetBy: i)
            if (word[index] == guess) {
                progress.insert(guess, at: index) //Check this later
                there = true
            }
        }
        if (there == false) {
            incorrectGuess.append(guess)
            numTries += 1
        } else {
            correctGuess.append(guess)
        }
    }
    
    
    //checks if the game is a Loss
    func isLoss() -> Bool {
        return numTries == totalTries
        
    }
    
    //helper function that checks whether the game is a win
    func isWin() -> Bool {
        return word == progress
    }

}
