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
        
    print(jogador01.name)
    
    let game = Game(player: jogador01, wordsOptions: ["casa", "fogao"])
    
    print(game.player.name)
}
//-------------------------


