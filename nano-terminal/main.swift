//
//  main.swift
//  nano-terminal
//
//  Created by Aline Osana Escobar and Julia Silveira de Souza on 16/03/21.
//

import Foundation

print("🐶 Olá! Qual o seu nome?")

if let input = readLine() {
    
    let jogador = Player(name: input)
    
    print("")
    print("\(jogador.name), digite:")
    
    let game = Game(player: jogador, wordsOptions: ["fogao", "familia", "banana", "casa", "amigo"])

    game.menuInicial()
}
//-------------------------


