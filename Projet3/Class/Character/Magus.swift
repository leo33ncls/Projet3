//
//  Magus.swift
//  Projet3
//
//  Created by Léo NICOLAS on 19/12/2018.
//  Copyright © 2018 Léo NICOLAS. All rights reserved.
//

import Foundation

// class that represents a magus
class Magus: Character {
    
    // Initialization
    init(characterName: String) {
        super.init(characterName: characterName, type: "Mage", health: 100, weapon: Wand())
    }
}
