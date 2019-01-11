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
    var numberOfRounds = 1
    var nameManager = NameManager()
    
    
    // Methods
    
    // Method to retrieve a name
    func choiceName() -> String {
        var name: String
        if let choice = readLine() {
            if nameManager.isNameValid(name: choice) {
                name = choice
                nameManager.nameArray.append(name)
            } else {
                print("⚠️ Nom trop court ou déjà utilisé. Choisissez un nouveau nom.")
                return choiceName()
            }
        } else {
            return choiceName()
        }
        return name
    }
    
    // Method allowing to create a team of 3 characters with their name
    func createCharacter(player: Player) {
        print("Choisissez un personnage"
            + " \n1 Le combattant"
            + " \n2 Le mage"
            + " \n3 Le colosse"
            + " \n4 Le nain"
            + " \n5 L'archer")
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
            case "5":
                print("Quel est le nom de votre archer ?")
                let name = choiceName()
                player.team.append(Archer(characterName: name))
            default:
                print("Je n'ai pas compris. \n")
            }
        }
    }
    
    // Method which creates a player
    func createPlayer() {
        print("Quel est votre nom ?")
        let player = Player(name: choiceName())
        while player.team.count < 3 {
            createCharacter(player: player)
        }
        print("Votre équipe est complète, \(player.name). \n")
        players.append(player)
    }
    
    // Method which displays the team's information
    func teamInformation(playerIndex: Int) {
        print("Joueur: \(players[playerIndex].name)"
            + " \nL'équipe se compose de:")
        for i in 0...2 {
            print("Un \(players[playerIndex].team[i].type) nommé \(players[playerIndex].team[i].characterName) armé \(players[playerIndex].team[i].weapon.name) ayant \(players[playerIndex].team[i].health) points de vie.")
        }
        print("\n")
    }
    
    
    // Method to choice a fighter
    func choiceFighter(playerIndex: Int) -> Character {
        var characterFighter: Character
        
        print("\(players[playerIndex].name), quel personnage va attaquer l'ennemie ou soigner un allié ?")
        for i in 0..<3 {
            print("\(i + 1)/ \(players[playerIndex].team[i].characterName)")
        }
        characterFighter = players[playerIndex].choiceCharacter()
        
        if characterFighter.IsAlive() {
            Chest().randomBoxRound(character: characterFighter)
            
        } else {
            print("\(characterFighter.characterName) est mort ! Choissisez un autre guerrier. \n")
            characterFighter = choiceFighter(playerIndex: playerIndex)
        }
        return characterFighter
    }
    
    
    
    // Method which reprensents a round
    func round(playerIndex: Int, playerIndexEnemy: Int) {
        let characterFighter = choiceFighter(playerIndex: playerIndex)
        var characterTarget: Character
        
        if characterFighter is Magus {
            print("Quel personnage va être soigné ? \n")
            for i in 0..<3 {
                print("\(i + 1)/ \(players[playerIndex].team[i].characterName)")
            }
            characterTarget = players[playerIndex].choiceCharacter()
            
            if characterTarget.IsAlive() {
                characterFighter.attack(target: characterTarget)
                
                print("\(characterFighter.characterName) donne \(characterFighter.weapon.damage) de vie à \(characterTarget.characterName). \n"
                    + "\(characterTarget.characterName) a maintenant \(characterTarget.health) de vie. \n" )
                
            } else {
                print("\(characterTarget.characterName) est déjà mort ! Choissisez une autre cible. \n")
                characterTarget = players[playerIndex].choiceCharacter()
            }
            
        } else {
            print("Quel personnage va être attaqué ?")
            for i in 0..<3 {
                print("\(i + 1)/ \(players[playerIndexEnemy].team[i].characterName)")
            }
            characterTarget = players[playerIndexEnemy].choiceCharacter()
            
            if characterTarget.IsAlive() {
                characterFighter.attack(target: characterTarget)
                print("\(characterFighter.characterName) inflige \(characterFighter.weapon.damage) de dégats à \(characterTarget.characterName). \n"
                    + "\(characterTarget.characterName) a maintenant \(characterTarget.health) de vie. \n" )
                
            } else {
                print("\(characterTarget.characterName) est déjà mort ! Choissisez une autre cible. \n")
                characterTarget = players[playerIndexEnemy].choiceCharacter()
            }
        }
    }
    
    
    // Method which gives de final statistics
    func finalInformation() {
        if players[0].isTeamAlive() {
            print("\(players[0].name) a gagné !")
        } else {
            print("\(players[1].name) a gagné !")
        }
        print("Statistiques finales: "
            + " Nombre de round: \(numberOfRounds)")
        teamInformation(playerIndex: 0)
        teamInformation(playerIndex: 1)
    }
    
    
    // The logic of the game
    func newGame() {
        while players.count < 2 {
             createPlayer()
        }
        teamInformation(playerIndex: 0)
        teamInformation(playerIndex: 1)
        while players[0].isTeamAlive() && players[1].isTeamAlive() {
            round(playerIndex: 0, playerIndexEnemy: 1)
            numberOfRounds += 1
            if players[0].isTeamAlive() && players[1].isTeamAlive() {
                round(playerIndex: 1, playerIndexEnemy: 0)
                numberOfRounds += 1
            }
        }
        print("La partie est finie !")
        finalInformation()
    }
}
