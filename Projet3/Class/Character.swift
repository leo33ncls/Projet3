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
    var healthMax: Int
    var weapon: Weapon
    
    // Initialization
    init(characterName: String, type: String, health: Int, healthMax: Int, weapon: Weapon) {
        self.characterName = characterName
        self.type = type
        self.health = health
        self.healthMax = healthMax
        self.weapon = weapon
    }
    
    // Method which make the character's attacks
    func attack(target: Character) {
        if target.health < weapon.damage {
            target.health = 0
        } else if target.healthMax < (target.health - weapon.damage) {
            target.health = target.healthMax
        } else {
            target.health -= weapon.damage
        }
    }
}

