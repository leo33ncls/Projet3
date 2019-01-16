//
//  Weapon.swift
//  Projet3
//
//  Created by Léo NICOLAS on 19/12/2018.
//  Copyright © 2018 Léo NICOLAS. All rights reserved.
//

import Foundation

// class that represents a weapon
class Weapon {
    
    
    //======================
    // Properties
    
    // The name of the weapon
    var name: String
    
    // The damage inflicted by the weapon
    var damage: Int
    
    
    //======================
    // Initialization
    init(name: String ,damage: Int) {
        self.name = name
        self.damage = damage
    }
    
}
