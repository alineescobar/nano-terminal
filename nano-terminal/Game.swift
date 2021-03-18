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
    
    func splitWord() -> [String]{
        let choosenWord = wordsOptions[0]
        var wordSplited: [String] = []
        
        wordSplited = choosenWord.map { String($0) }
        
        return wordSplited
    }
    
    func showInitialGame() -> String {
        let splitedWord = splitWord()
        print("Olá! Sua palavra contem \(splitedWord.count) letras!")
        let draw = String(repeating: " _ ", count: splitedWord.count)
        return draw
    }
    
    func checkMatchLetters() {
        
        var usedLetters: [String] = []
        let choosenWord = wordsOptions[0]
        var errors: Int = 0
        
        print("Escolha uma letra de A à Z:")
        
        if let letter = readLine() {
            usedLetters.append(letter)
            print("letras usadas:")
            
            for letter in usedLetters{
                print(letter)
            }
            
            if choosenWord.contains(letter){
                
                let splitedWord = splitWord()
                var palavraExibida: [String] = splitedWord
            
                for i in 0...splitedWord.count-1 {
                    if splitedWord[i] == letter {
                        palavraExibida[i] = letter
                    } else {
                        palavraExibida[i] = "*"
                    }
                }
                
                if palavraExibida.contains("*") {
                    print("ainda falta adivinhar alguma letra")
                }
                else{
                    print("voce venceu!!!")
                }
                
                print("Atualmente:", palavraExibida)
                
                print("Você acertou")
                
            }else {
                print("Você errou. Está letra não está dentro da palavra.")
                errors += 1
            }
            print(errors)
        }
    }
    
}
