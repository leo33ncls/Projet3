//
//  Archer.swift
//  Projet3
//
//  Created by Léo NICOLAS on 29/12/2018.
//  Copyright © 2018 Léo NICOLAS. All rights reserved.
//

import Foundation

// class that represents an archer
class Archer: Character {
    
    // Initialization
    init(characterName: String) {
        super.init(characterName: characterName, type: "Archer", health: 70, weapon: Bow())
    }
    
}
