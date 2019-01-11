//
//  Bow.swift
//  Projet3
//
//  Created by Léo NICOLAS on 29/12/2018.
//  Copyright © 2018 Léo NICOLAS. All rights reserved.
//

import Foundation

class Bow: Weapon {
    
    override var damage: Int {
        get {
            return Int.random(in: 0...20)
        }
        set {}
    }
    
    init() {
        super.init(name: "arc", damage: 5)
    }
    
}
