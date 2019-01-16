//
//  RangedWeapon.swift
//  Projet3
//
//  Created by Léo NICOLAS on 16/01/2019.
//  Copyright © 2019 Léo NICOLAS. All rights reserved.
//

import Foundation

class RangedWeapon: Weapon {
    
    var damageMin: Int
    var damageMax: Int
    
    override var damage: Int {
        get {
            return Int.random(in: damageMin...damageMax)
        }
        set {}
    }
    
    init(name: String, damage: Int, damageMin: Int, damageMax: Int) {
        self.damageMin = damageMin
        self.damageMax = damageMax
        super.init(name: name, damage: damage)
    }
    
}
