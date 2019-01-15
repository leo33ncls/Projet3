//
//  GoldBow.swift
//  Projet3
//
//  Created by Léo NICOLAS on 15/01/2019.
//  Copyright © 2019 Léo NICOLAS. All rights reserved.
//

import Foundation

class GoldBow: Weapon {
    
    override var damage: Int {
        get {
            return Int.random(in: 10...30)
        }
        set {}
    }
    
    init() {
        super.init(name: "arc en or", damage: 10)
    }
    
}
