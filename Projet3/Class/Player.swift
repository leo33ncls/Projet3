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
    
    // Method which allows to choice a character in your team
    func choiceCharacter() -> Character {
        if let choice = readLine() {
            if let index = Int(choice), team.indices.contains(index - 1) && team[index - 1].IsAlive() {
                return team[index - 1]
            } else {
                print("Mauvais choix. Reesayer")
                return choiceCharacter()
            }
        } else {
            return choiceCharacter()
        }
    }
}


