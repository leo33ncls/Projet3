//
//  Archer.swift
//  Projet3
//
//  Created by Léo NICOLAS on 29/12/2018.
//  Copyright © 2018 Léo NICOLAS. All rights reserved.
//

import Foundation

class Archer: Character {
    
    
    init(characterName: String) {
        super.init(characterName: characterName, type: "Archer", health: 60, healthMax: 60, weapon: Bow())
    }
    
    override func attack(target: Character) {
        if weapon.name == "arc" {
            let randomDamage = Bow().randomDamage()
            if target.health < randomDamage {
                target.health = 0
            } else if target.healthMax < (target.health - randomDamage) {
                target.health = target.healthMax
            } else {
                target.health -= randomDamage
            }
        } else {
            if target.health < weapon.damage {
                target.health = 0
            } else if target.healthMax < (target.health - weapon.damage) {
                target.health = target.healthMax
            } else {
                target.health -= weapon.damage
            }
        }
    }
    
}
