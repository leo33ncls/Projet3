//
//  Character.swift
//  Projet3
//
//  Created by Léo NICOLAS on 19/12/2018.
//  Copyright © 2018 Léo NICOLAS. All rights reserved.
//

import Foundation

class Character {
    var characterName: String
    var health: Int
    var weapon: Weapon
    
    init(characterName: String, health: Int, weapon: Weapon) {
        self.characterName = characterName
        self.health = health
        self.weapon = weapon
    }
}

