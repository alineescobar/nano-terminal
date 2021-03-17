//
//  Game.swift
//  nano-terminal
//
//  Created by Aline Osana Escobar on 16/03/21.
//

import Cocoa

class Game {
    var player: Player
    var wordsOptions: [String]
    
    init(player: Player, wordsOptions: [String]) {
        self.player = player
        self.wordsOptions = wordsOptions
    }
    
    func validateInput() -> String {

        if let letter = readLine(){
            if let valideLetter = letter.first{
                return valideLetter
            }
        }
    }

    func validateAlphabet() {
        let pattern = "[a-z]"

        let results = letter.range(of: pattern, options:.regularExpression)

    }
    
    
    func checkMatchLetters() -> Bool {
        
        var usedLetters: [String] = []
        var containsLetter: Bool = false
                
        print("Escolha uma letra de A à Z:")
        
        if let letter = readLine() {
            
            usedLetters.append(letter)
            print("letras usadas:")
            
            for letter in usedLetters{
                print(letter)
            }
            
            if wordsOptions[0].contains(letter){

                print("Você acertou")
                containsLetter = true
                
            }else {
                print("Você errou. Está letra não está dentro da palavra.")
                containsLetter = false
                
            }
        }
        return containsLetter
    }
    
    func gameGoOn() {
        
        var correct: Bool = false
        
        while !correct {
            
        }
    }
}
