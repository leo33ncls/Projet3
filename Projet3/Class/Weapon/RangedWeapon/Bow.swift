//
//  Bow.swift
//  Projet3
//
//  Created by Léo NICOLAS on 29/12/2018.
//  Copyright © 2018 Léo NICOLAS. All rights reserved.
//

import Foundation

// class that represents a bow
class Bow: RangedWeapon {
    
    // Initialization
    init() {
        super.init(name: "arc", damage: 10, damageMin: 0, damageMax: 20)
    }
}
