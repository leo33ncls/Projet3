//
//  Bow.swift
//  Projet3
//
//  Created by Léo NICOLAS on 29/12/2018.
//  Copyright © 2018 Léo NICOLAS. All rights reserved.
//

import Foundation

class Bow: Weapon {
    
    init() {
        super.init(name: "arc", damage: 5)
    }
    
    
    func randomDamage() -> Int{
        let randomDamage = Int(arc4random_uniform(UInt32(21)))
        return randomDamage
    }
}
