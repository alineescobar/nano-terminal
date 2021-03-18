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
    
    func returnValidInput() -> String{
        var validInput: String = ""
        
        if let input = readLine() {
            
            let letter = input.lowercased()
            if letter.count == 1 && letter >= "a" && letter <= "z" {
                validInput = letter
            } else {
                print("Entrada inválida!")
            }
        }
        return validInput
    }
    
    func splitWord() -> [String]{
        let choosenWord = wordsOptions[0]
        var wordSplited: [String] = []
        
        wordSplited = choosenWord.map { String($0) }
        
        return wordSplited
    }
    
    func showInitialGame() {
        let splitedWord = splitWord()
        print("Olá! Sua palavra contém \(splitedWord.count) letras!")
        let draw = String(repeating: " _ ", count: splitedWord.count)
        print(draw)
    }
    
    func playTheGame() {
        let _ = showInitialGame()
        var usedLetters: [String] = []
        let choosenWord = wordsOptions[0]
        var errors: Int = 0
        let splitedWord = splitWord()
        var palavraExibida: [String] = splitedWord
        var teste: [String] = ["*", "*", "*", "*"]
        var stillPlaying: Bool = true
        
        print("Escolha uma letra de A à Z:")
        
        while errors < 5 && stillPlaying {

            let letter = returnValidInput()
            usedLetters.append(letter)
            print(usedLetters)
            
            if choosenWord.contains(letter) {
                
                for i in 0...splitedWord.count-1 {
                    if splitedWord[i] == letter {
                        teste[i] = letter
                    }
                }
                
                if teste == palavraExibida {
                    stillPlaying = false
                }
                
                print("Atualmente:", teste)
                
                print("Você acertou")
                
            } else {
                print("Você errou. Está letra não está dentro da palavra.")
                errors += 1
            }
        }
    }
}
