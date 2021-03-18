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
        print("dentro do splitword: ", choosenWord)
        var wordSplited: [String] = []
        
        wordSplited = choosenWord.map { String($0) }
        
        return wordSplited
    }
    
    func playTheGame() {
        var usedLetters: [String] = []
        let choosenWord = sortWord()
        var errors: Int = 0
        let splitedWord = splitWord()
        var palavraExibida: [String] = splitedWord
        var stillPlaying: Bool = true
        var teste: [String] = []
        
        print("Olá! Sua palavra contém \(splitedWord.count) letras!")
        let draw = String(repeating: " _ ", count: splitedWord.count)
        print(draw)
        
        for i in 0...splitedWord.count-1 {
            teste.append("*")
        }
        
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
