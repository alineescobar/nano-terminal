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
    
    func menuInicial() {
        print("1: Novo Jogo")
        print("0: Sair do Jogo")
        
        if let option = readLine() {
            if option == "1"{
                playTheGame()
                
            } else if option == "0" {
                print("Até a próxima!😉")
                exit(0)
                
            }else {
                menuInicial()
            }
        }
    }
    
    func returnValidInput() -> (validInput: String, wantTip:Bool){
        var validInput: String = ""
        var wantTip: Bool = false
        if let input = readLine() {
            
            let letter = input.lowercased()
            
            if !player.hasUsedTip {
                if letter == "dica" {
                    print("Você pediu uma dica!")
                    wantTip = true
                }
                else if letter.count == 1 && letter >= "a" && letter <= "z" {
                    validInput = letter
                } else {
                    print("Caracter inválido!")
                }
            }
            
            
        }
        return (validInput, wantTip)
    }
    
    func sortWord() -> String {
        
        if wordsOptions.isEmpty {
            return ""
            
        }else {
            let word = wordsOptions.randomElement()
            guard let wordString = word else { return "" }
            
            let indexWord = wordsOptions.firstIndex(of: wordString)
            guard let firstIndexWord = indexWord else { return "" }
            
            wordsOptions.remove(at:firstIndexWord)
            return wordString
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
        var letter: String = ""
        var remainingLetters: [String] = []
        
        print("")
        print("Antes de começarmos: você tem direito a uma dica! Para usa-la, escreva dica ao pedir uma letra!")
        print("Para ajudar a construir a casa do Drops, complete a palavra abaixo ⬇️.")
        print("")
        print("A palavra contém \(splitedWord.count) letras!")
        let draw = String(repeating: " _ ", count: splitedWord.count)
        print(draw)
        print("")
        
        for _ in 0...splitedWord.count-1 {
            shownWord.append(" _ ")
        }
        
        print("Escolha uma letra de A à Z:")
        
        while errors < 5 && stillPlaying {
            print(errors)
            
            let input = returnValidInput()
            
            if input.wantTip {
                remainingLetters = Array(Set(splitedWord).subtracting(shownWord))
                letter = remainingLetters.randomElement() ?? ""
                player.hasUsedTip = true
                
            } else {
                letter = input.validInput
            }
            
            
            if usedLetters.contains(letter){
                print("")
                print("Essa letra já foi usada")
                print("Escolha outra letra de A à Z:")
                
            } else {
                usedLetters.append(letter)
                let joined = usedLetters.joined(separator: ", ")
                
                if splitedWord.contains(letter) {
                    for i in 0...splitedWord.count-1 {
                        if splitedWord[i] == letter {
                            shownWord[i] = letter
                        }
                    }
                    
                    if shownWord == splitedWord {
                        print("")
                        print("Você conseguiu, Drops está protegido ❤️")
                        print("")
                        menuInicial()
                        stillPlaying = false
                        
                        
                    } else {
                        print("")
                        print("Parabéns, você acertou uma letra! Escolha outra letra de A à Z:")
                        print("Palavra:", shownWord.joined(separator: " "))
                        print("")
                        print("Letras já usadas: \(joined)")
                        print("")
                    }
                    
                } else {
                    print("Você errou. Escolha outra letra de A à Z:")
                    print("Palavra:", shownWord.joined(separator: " "))
                    print("")
                    if player.hasUsedTip {
                        errors += 0
                    } else {
                        errors += 1
                    }
                }
                
                if errors == 5 {
                    print("Você não conseguiu terminar, Drops ficou na chuva ☹️")
                    menuInicial()
                    exit(0)
                }
            }
        }
    }
}
