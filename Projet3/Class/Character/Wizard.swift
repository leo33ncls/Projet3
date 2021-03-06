//
//  Wizard.swift
//  Projet3
//
//  Created by Léo NICOLAS on 29/12/2018.
//  Copyright © 2018 Léo NICOLAS. All rights reserved.
//

import Foundation

// class that represents a wizard
class Wizard: Character {
    
    
    //======================
    // Initialization
    init(characterName: String) {
        super.init(characterName: characterName, type: "Sorcier", health: 60, weapon: Curse())
    }
    
    
    //======================
    // Method which make the character's attacks
    override func attack(target: Character) -> Int {
        
        if target is Magus {
            if  -weapon.damage < target.weapon.damage {
                target.weapon.damage = 0
            } else {
                target.weapon.damage += weapon.damage
            }
            
        } else if target is Wizard {    // the attack removes all the damage from the target's curse but sacrifices his own curse
            target.weapon.damage = 0
            weapon.damage = 0
            
        } else if let targetWeapon = target.weapon as? RangedWeapon {
            if targetWeapon.damageMax < weapon.damage {
                targetWeapon.damageMax = targetWeapon.damageMin
            } else {
                targetWeapon.damageMax -= weapon.damage
            }
            
        } else {
            if target.weapon.damage < weapon.damage {
                target.weapon.damage = 0
            } else {
                target.weapon.damage -= weapon.damage
            }
        }
        return weapon.damage
    }
    
}
