//
//  DamagedBow.swift
//  Projet3
//
//  Created by Léo NICOLAS on 15/01/2019.
//  Copyright © 2019 Léo NICOLAS. All rights reserved.
//

import Foundation

class DamagedBow: RangedWeapon {
    
    init() {
        super.init(name: "arc endommagé", damage: 5, damageMin: 0, damageMax: 10)
    }
}
