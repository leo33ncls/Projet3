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
    var nameArray = [String]()
    var characterFighter = Character(characterName: "", type: "", health: 0, weapon: Sword())
    var characterTarget = Character(characterName: "", type: "", health: 0, weapon: Sword())
    
    
    // Methods
    
    // Method to check if the name is valid
    func nameChecked(name: String) -> Bool {
        var isUsed = false
        if nameArray.count == 0 {
            nameArray.append(name)
            isUsed = false
        } else {
            for i in 0..<nameArray.count {
                if name == nameArray[i] {
                    isUsed = true
                } else {
                    isUsed = false
                }
            }
        }
        return isUsed
    }
    
    // Method to retrieve a name
    func choiceName() -> String {
        var name: String
        if let choice = readLine() {
            if choice.count >= 2 && nameChecked(name: choice) == false {
                name = choice
                nameArray.append(name)
            } else {
                print("Nom trop court ou déjà utilisé. Choisissez un nouveau nom.")
                name = choiceName()
            }
        } else {
            name = "SansNom"
        }
        return name
    }
    
    // Method retrieving the player's name
    func playerName(player: Player) {
        print("Quel est votre nom ?")
        player.name = choiceName()
    }
    
    // Method allowing to create a team of 3 characters with their name
    func choiceTeam(player: Player) {
        while player.team.count < 3 {
            print("Choisissez un personnage"
                + " \n1 Le combattant"
                + " \n2 Le mage"
                + " \n3 Le colosse"
                + " \n4 Le nain"
                + " \n5 L'archer"
                + " \n6 Le sorcier")
            if let choice = readLine() {
                switch choice {
                case "1":
                    print("Quel est le nom de votre combattant ?")
                    let name = choiceName()
                    player.team.append(Warrior(characterName: name))
                case "2":
                    print("Quel est le nom de votre mage ?")
                    let name = choiceName()
                    player.team.append(Magus(characterName: name))
                case "3":
                    print("Quel est le nom de votre colosse ?")
                    let name = choiceName()
                    player.team.append(Colossus(characterName: name))
                case "4":
                    print("Quel est le nom de votre nain ?")
                    let name = choiceName()
                    player.team.append(Dwarf(characterName: name))
                default:
                    print("Je n'ai pas compris")
                }
            }
        }
        print("Votre équipe est complète, \(player.name). \n")
    }
    
    // Method creating a player
    func createPlayer() {
        let player = Player()
        playerName(player: player)
        choiceTeam(player: player)
        players.append(player)
    }
    
    // Method wich displays the team's information
    func teamInformation(playerIndex: Int) {
        print("Joueur: \(players[playerIndex].name)"
            + " \nL'équipe se compose de:")
        for i in 0...2 {
            print("Un \(players[playerIndex].team[i].type) nommé \(players[playerIndex].team[i].characterName) armé \(players[playerIndex].team[i].weapon.name) ayant \(players[playerIndex].team[i].health) points de vie.")
        }
        print("\n")
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
        round()
        
    }
}
