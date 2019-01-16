//
//  Player.swift
//  Projet3
//
//  Created by Léo NICOLAS on 19/12/2018.
//  Copyright © 2018 Léo NICOLAS. All rights reserved.
//

import Foundation

// class which represents a player
class Player {
    
    
    //======================
    // Properties
    
    // The name of the player
    var name: String
    
    // The player's team which contains characters
    var team = [Character]()
    
    
    //======================
    // Initialization
    init(name: String) {
        self.name = name
    }
    
    
    //======================
    // Methods
    
    // Method which checks if the team are still alive
    func isTeamAlive() -> Bool{
        for character in team {
            if character.isAlive() {
                return true
            }
        }
        return false
    }
    
}


