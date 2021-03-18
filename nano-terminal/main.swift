//
//  main.swift
//  nano-terminal
//
//  Created by Aline Osana Escobar and Julia Silveira de Souza on 16/03/21.
//

import Foundation

let palavra: String  = "casa"

if let input = readLine() {
    
    let jogador01 = Player(name: input)
        
    print("Olá, \(jogador01.name) o jogo vai começar!")
    
    let game = Game(player: jogador01, wordsOptions: ["casa", "fogao"])
}
//-------------------------


