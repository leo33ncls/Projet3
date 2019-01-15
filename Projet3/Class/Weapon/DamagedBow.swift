//
//  DamagedBow.swift
//  Projet3
//
//  Created by Léo NICOLAS on 15/01/2019.
//  Copyright © 2019 Léo NICOLAS. All rights reserved.
//

import Foundation

class DamagedBow: Weapon {
    
    override var damage: Int {
        get {
            return Int.random(in: 0...10)
        }
        set {}
    }
    
    init() {
        super.init(name: "arc endommagé", damage: 0)
    }
    
}
