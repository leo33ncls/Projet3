//
//  Game.swift
//  Projet3
//
//  Created by Léo NICOLAS on 19/12/2018.
//  Copyright © 2018 Léo NICOLAS. All rights reserved.
//

import Foundation

class Game {
    
    // Properties
    var players = [Player]()
    var characterFighter = Character(characterName: "", type: "", health: 0, weapon: Sword())
    var characterTarget = Character(characterName: "", type: "", health: 0, weapon: Sword())
    
    
    // Methods
    
    // Method creating a player
    func createPlayer() {
        let player = Player()
        player.playerName()
        player.choiceTeam()
        players.append(player)
    }
    
    // Method wich displays the team's information
    func teamInformation() {
        print("Jouer 1: \(players[0].name)"
            + " \nL'équipe se compose de:"
            + " \nUn \(players[0].team[0].type) nommé \(players[0].team[0].characterName) armé \(players[0].team[0].weapon.name) ayant \(players[0].team[0].health) points de vie.)"
            + " \nUn \(players[0].team[1].type) nommé \(players[0].team[1].characterName) armé \(players[0].team[1].weapon.name) ayant \(players[0].team[1].health) points de vie.)"
            + " \nUn \(players[0].team[2].type) nommé \(players[0].team[2].characterName) armé \(players[0].team[2].weapon.name) ayant \(players[0].team[2].health) points de vie.) \n")
        print("Jouer 2: \(players[1].name)"
            + " \nL'équipe se compose de:"
            + " \nUn \(players[1].team[0].type) nommé \(players[1].team[0].characterName) armé \(players[1].team[0].weapon.name) ayant \(players[1].team[0].health) points de vie.)"
            + " \nUn \(players[1].team[1].type) nommé \(players[1].team[1].characterName) armé \(players[1].team[1].weapon.name) ayant \(players[1].team[1].health) points de vie.)"
            + " \nUn \(players[1].team[2].type) nommé \(players[1].team[2].characterName) armé \(players[1].team[2].weapon.name) ayant \(players[1].team[2].health) points de vie.) \n")
    }
    
    // Method allowing to choose a character of your team who is going to attack the enemy
    func choiceFichter() {
        print("\(players[0].name), quel personnage va attaquer l'ennemie ?"
            + "\n1 \(players[0].team[0].characterName)"
            + "\n2 \(players[0].team[1].characterName)"
            + "\n3 \(players[0].team[2].characterName)")
        if let choice = readLine() {
            switch choice {
            case "1":
                characterFighter = players[0].team[0]
            case "2":
                characterFighter = players[0].team[1]
            case "3":
                characterFighter = players[0].team[2]
            default:
                print("Je ne comprends pas")
            }
        }
    }
    
    // Method allowing to choose an enemy character to attack
    func choiceTarget() {
        print("\(players[0].name), quel est la cible ?"
            + "\n1 \(players[1].team[0].characterName)"
            + "\n2 \(players[1].team[1].characterName)"
            + "\n3 \(players[1].team[2].characterName)")
        if let choice = readLine() {
            switch choice {
            case "1":
                characterTarget = players[1].team[0]
            case "2":
                characterTarget = players[1].team[1]
            case "3":
                characterTarget = players[1].team[2]
            default:
                print("Je ne comprends pas")
            }
        }
    }
    
    // Method which makes the attack and give information on the consequences
    func attack() {
        let healthTarget = characterTarget.health - characterFighter.weapon.damage
        print("\(characterFighter.characterName) inflige \(characterFighter.weapon.damage) de dégats à \(characterTarget.characterName)."
            + "\nIl reste \(healthTarget) de vie à \(characterTarget.characterName)")
    }
    
    // Method which represents a round
    func round() {
        choiceFichter()
        choiceTarget()
        attack()
    }
    
    
    
    // The logic of the game
    func newGame() {
        while players.count < 2 {
             createPlayer()
        }
        teamInformation()
        round()
        
    }
}
