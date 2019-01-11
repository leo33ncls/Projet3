//
//  Player.swift
//  Projet3
//
//  Created by Léo NICOLAS on 19/12/2018.
//  Copyright © 2018 Léo NICOLAS. All rights reserved.
//

import Foundation

class Player {
    
    // Properties
    var name: String
    var team = [Character]()
    
    init(name: String) {
        self.name = name
    }
    
    // Method which checks if the team are still alive
    func isTeamAlive() -> Bool{
        for character in team {
            if character.IsAlive() {
                return true
            }
        }
        return false
    }
    
}


