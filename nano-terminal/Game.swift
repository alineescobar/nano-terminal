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
    
    func validateInput(letter:String) -> Bool{

        if letter.count == 1 && letter >= "a" && letter <= "Z"{
            return true
        }
        return false
    }
    
    func checkMatchLetters() -> Bool {
        
        var usedLetters: [String] = []
        var containsLetter: Bool = false
                
        print("Digite uma letra de A à Z:")
        
        if let letter = readLine() {
            if validateInput(letter: letter) == false {
                return false
            }
            
            usedLetters.append(letter)
            print("letras usadas:")
            
            for letter in usedLetters{
                print(letter)
            }
            
            if wordsOptions[0].contains(letter) {
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
