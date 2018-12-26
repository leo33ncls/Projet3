//
//  Warrior.swift
//  Projet3
//
//  Created by Léo NICOLAS on 19/12/2018.
//  Copyright © 2018 Léo NICOLAS. All rights reserved.
//

import Foundation

class Warrior: Character {
    
    // Initialization
    init(characterName: String) {
        super.init(characterName: characterName, type: "Combattant", health: 100, healthMax: 100, weapon: Sword())
    }
}
