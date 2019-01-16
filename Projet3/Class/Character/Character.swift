//
//  Character.swift
//  Projet3
//
//  Created by Léo NICOLAS on 19/12/2018.
//  Copyright © 2018 Léo NICOLAS. All rights reserved.
//

import Foundation

// class that represents a character
class Character {
    
    
    //======================
    // Properties
    
    // The name of the character
    var characterName: String
    
    // The type of the character
    var type: String
    
    // The health
    var health: Int
    
    // The maximum health
    var healthMax: Int
    
    // The character's weapon
    var weapon: Weapon
    
    
    //======================
    // Initialization
    init(characterName: String, type: String, health: Int, weapon: Weapon) {
        self.characterName = characterName
        self.type = type
        self.health = health
        self.healthMax = health
        self.weapon = weapon
    }
    
    
    //======================
    // Methods
    
    // Method which make the character's attacks
    func attack(target: Character) -> Int {
        let damage = weapon.damage
        if target.health < damage {
            target.health = 0
        } else if target.healthMax < (target.health - damage) {
            target.health = target.healthMax
        } else {
            target.health -= damage
        }
        return damage
    }
    
    // Method which checks if the player is alive
    func isAlive() -> Bool {
        if health <= 0 {
            return false
        } else {
            return true
        }
    }
}

