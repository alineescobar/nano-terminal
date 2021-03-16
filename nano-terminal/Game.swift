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
}
