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
    
    func sortWord() -> String {
        
        if wordsOptions.isEmpty {
            return ""
            
        }else {
            let word = wordsOptions.randomElement()
            let indexWord = wordsOptions.firstIndex(of: word!)
            wordsOptions.remove(at: Int(indexWord!))
            return word ?? ""
        }
    }
    
    func splitWord() -> [String]{
        let choosenWord = sortWord()
        var wordSplited: [String] = []
        
        wordSplited = choosenWord.map { String($0) }
        
        return wordSplited
    }
    
    func playTheGame() {
        var usedLetters: [String] = []
        var errors: Int = 0
        let splitedWord = splitWord()
        var stillPlaying: Bool = true
        var shownWord: [String] = []
        
        print("Olá! Sua palavra contém \(splitedWord.count) letras!")
        let draw = String(repeating: " _ ", count: splitedWord.count)
        print(draw)
        
        for _ in 0...splitedWord.count-1 {
            shownWord.append("*")
        }
        
        print("Escolha uma letra de A à Z:")
        
        while errors < 5 && stillPlaying {

            let letter = returnValidInput()
            usedLetters.append(letter)
            print(usedLetters)
            
            if splitedWord.contains(letter) {
                for i in 0...splitedWord.count-1 {
                    if splitedWord[i] == letter {
                        shownWord[i] = letter
                    }
                }
                
                if shownWord == splitedWord {
                    print("vitoria")
                    stillPlaying = false
                } else {
                    print("Atualmente:", shownWord)
                    print("Você acertou")
                    print("Escolha uma letra de A à Z:")
                }                
                
            } else {
                print("Você errou. Está letra não está dentro da palavra.")
                print("Atualmente:", shownWord)
                print("Escolha uma letra de A à Z:")
                errors += 1
            }
        }
    }
}
