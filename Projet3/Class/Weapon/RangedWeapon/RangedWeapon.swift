//
//  RangedWeapon.swift
//  Projet3
//
//  Created by Léo NICOLAS on 16/01/2019.
//  Copyright © 2019 Léo NICOLAS. All rights reserved.
//

import Foundation

// class that represents a ranged weapon
class RangedWeapon: Weapon {
    
    
    //======================
    // Properties
    
    // The minimum damage of the weapon
    var damageMin: Int
    
    // The maximum damage
    var damageMax: Int
    
    // The damage inflicted by the weapon
    override var damage: Int {
        get {
            return Int.random(in: damageMin...damageMax)
        }
        set {}
    }
    
    
    //======================
    // Initialization
    init(name: String, damage: Int, damageMin: Int, damageMax: Int) {
        self.damageMin = damageMin
        self.damageMax = damageMax
        super.init(name: name, damage: damage)
    }
    
}
