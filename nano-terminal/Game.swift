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
        print(" 1: Novo Jogo")
        print(" 0: Sair do Jogo")
        
        if let option = readLine() {
            if option == "1"{
                playTheGame()
                
            } else if option == "0" {
                print(" Até a próxima!😉")
                exit(0)
                
            }else {
                menuInicial()
            }
        }
    }
    
    func returnValidInput() -> (validInput: String, wantTip:Bool){
        var validInput: String = ""
        var wantHelp: Bool = false
        
        if let input = readLine() {
            
            let letter = input.lowercased()
            
            if !player.hasUsedHelp {
                if letter == "ajuda" {
                    print(" Foi aqui que pediram uma ajuda? Incluímos uma letra pra você!")
                    wantHelp = true
                }
                
                else if letter.count == 1 && letter >= "a" && letter <= "z" {
                    validInput = letter
                    
                } else {
                    validInput = "*"
                    print("")
                }
                
            } else {
                
                if letter.count == 1 && letter >= "a" && letter <= "z" {
                    validInput = letter
                    
                } else if letter == "ajuda"{
                    validInput = "!"
                }
                else {
                    validInput = "*"
                    print("")
                }
            }
        }
        return (validInput, wantHelp)
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
        player.hasUsedHelp = false
        
        print("")
        print("                     Drops é um vira-lata.")
        print("")
        print("             Ele está precisando de uma casinha...")
        print("")
        print("                      ┈╭━━━━━━━━━━━━━╮┈ ")
        print("                     ╭╯ ┈╭━━╮ ┈ ╭━━╮┈ ╰╮ ")
        print("                     ┃ ┈┃┃╭╮┃ ┈ ┃╭╮┃┃┈ ┃ ")
        print("                     ┃ ┈┃┻┻┻┛ ┈ ┗┻┻┻┃┈ ┃ ")
        print("                     ┃ ┈┃╭╮┈ ◢▇◣ ┈╭╮┃┈ ┃ ")
        print("                     ╰┳╯ ┃ ╰━━┳┳┳╯ ┃ ╰┳╯ ")
        print("                     ┈┃ ┈╰━━━━┫┃┣━━╯┈ ┃┈ ")
        print("                     ┈┃ ┈┈┈ ┈┈╰━╯ ┈┈┈ ┃┈")
        print("")
        print("             Ajude a construir a nova casa dele...")
        print("")
        print("                 Antes que comece a chover!")
        print("")
        print(" Para ajudar o Drops, complete corretamente a palavra abaixo ⬇️")
        print("")
        print(" A palavra contém \(splitedWord.count) letras!")
        let draw = String(repeating: " _ ", count: splitedWord.count)
        print(draw)
        print("")
        print(" Você pode usar uma dica. Para usá-la, escreva 'ajuda' quando quiser.")
        print("")
        
        for _ in 0...splitedWord.count-1 {
            shownWord.append(" _ ")
        }
        
        print(" Digite uma letra de A à Z:")
        
        while errors < 5 && stillPlaying {
            print("")
            let input = returnValidInput()
            
            if input.wantTip && !player.hasUsedHelp {
                remainingLetters = Array(Set(splitedWord).subtracting(shownWord))
                letter = remainingLetters.randomElement() ?? ""
                player.hasUsedHelp = true
            }
            else {
                letter = input.validInput
            }
            
            if usedLetters.contains(letter) && !(input.validInput == "*") {
                print("")
                print("     Essa letra já foi usada.")
                print("")
                print(" Palavra:", shownWord.joined(separator: " "))
                print("")
                print(" Digite outra letra de A à Z:")

            } else if input.validInput == "*"{
                print("")
                print(" Você está tentando usar um caractere inválido!")
                print("")
                print(" Digite outra letra de A à Z:")

            } else if input.validInput == "!" {
                print("")
                print("     Você já usou a ajuda!")
                print("")
                print(" Palavra:", shownWord.joined(separator: " "))
                print("")
                print(" Digite uma letra de A à Z:")

            }
            else {
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
                        print("             Você conseguiu!!")
                        print("     Drops está protegido na nova casinha!")
                        print("")
                        print("                 //-------\\\\")
                        print("                //-_-_-_-_-\\\\")
                        print("               //_-_-_-_-_-_\\\\")
                        print("              //_-_-_-_-_-_-_\\\\")
                        print("             //---------------\\\\")
                        print("              |     DROPS     |")
                        print("              |   _________   |")
                        print("              |   ||     ||   |")
                        print("              |   ||     ||   |")
                        print("              |   ||     ||   |")
                        print("           ------------------------")
                        print("")
                        menuInicial()
                        stillPlaying = false
                        
                    } else {
                        print("")
                        print("     Oba, você acertou uma letra 🥳!")
                        print("")
                        print(" Palavra:", shownWord.joined(separator: " "))
                        print("")
                        print(" Letras já usadas: \(joined)")
                        print(" Digite outra letra de A à Z:")
                    }
                    
                } else {
                        print("")
                        print("     Ah, você errou ☹️")
                        print("")
                        print(" Palavra:", shownWord.joined(separator: " "))
                        print("")
                    
                        errors += 1
                    
                        if errors != 5 {
                            
                            print(" Letras já usadas: \(joined)")
                            print(" Digite uma letra de A à Z:")
                        }
                    }
                
                if errors == 5 {
                    print("")
                    print("         ☁️☁️☁️☁️☁️☁️☁️☁️☁️☁️☁️☁️☁️☁️☁️☁️")
                    print("         💧💧💧💧⚡️💧💧💧💧💧💧💧💧⚡️💧💧")
                    print("         💧💧DROPS FICOU NA CHUVA 🤧💧💧")
                    print("         💧💧💧💧💧💧💧💧💧💧💧💧💧💧💧💧")
                    print("         💧💧⚡️💧💧💧💧💧💧💧💧⚡️💧💧💧💧")
                    print("")
                    
                    menuInicial()
                    exit(0)
                }
            }
        }
    }
}
