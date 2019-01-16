//
//  GoldBow.swift
//  Projet3
//
//  Created by Léo NICOLAS on 15/01/2019.
//  Copyright © 2019 Léo NICOLAS. All rights reserved.
//

import Foundation

// class that represents a gold bow
class GoldBow: RangedWeapon {
    
    // Initialization
    init() {
        super.init(name: "arc en or", damage: 20, damageMin: 10, damageMax: 30)
    }
}
