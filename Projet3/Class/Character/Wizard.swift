//
//  Wizard.swift
//  Projet3
//
//  Created by Léo NICOLAS on 29/12/2018.
//  Copyright © 2018 Léo NICOLAS. All rights reserved.
//

import Foundation

class Wizard: Character {
    
    init(characterName: String) {
        super.init(characterName: characterName, type: "Sorcier", health: 60, weapon: Curse())
    }
    
    override func attack(target: Character) -> Int {
        if target is Magus {
            if  -weapon.damage < target.weapon.damage {
                target.weapon.damage = 0
            } else {
                target.weapon.damage += weapon.damage
            }
            
        } else if target is Wizard {
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
