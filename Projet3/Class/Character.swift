//
//  Character.swift
//  Projet3
//
//  Created by Léo NICOLAS on 19/12/2018.
//  Copyright © 2018 Léo NICOLAS. All rights reserved.
//

import Foundation

class Character {
    
    // Properties
    var characterName: String
    var type: String
    var health: Int
    var weapon: Weapon
    
    // Initialization
    init(characterName: String, type: String, health: Int, weapon: Weapon) {
        self.characterName = characterName
        self.type = type
        self.health = health
        self.weapon = weapon
    }
    
}

