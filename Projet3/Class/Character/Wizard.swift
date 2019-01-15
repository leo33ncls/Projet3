//
//  Wizard.swift
//  Projet3
//
//  Created by Léo NICOLAS on 29/12/2018.
//  Copyright © 2018 Léo NICOLAS. All rights reserved.
//

import Foundation

class Wizard: Character {
    
    init(characterName: String) {
        super.init(characterName: characterName, type: "Sorcier", health: 60, healthMax: 60, weapon: Curse())
    }
}
