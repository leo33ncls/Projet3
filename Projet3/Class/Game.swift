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
                player.team.append(Warrior(characterName: choiceName()))
            case "2":
                print("Quel est le nom de votre mage ?")
                player.team.append(Magus(characterName: choiceName()))
            case "3":
                print("Quel est le nom de votre colosse ?")
                player.team.append(Colossus(characterName: choiceName()))
            case "4":
                print("Quel est le nom de votre nain ?")
                player.team.append(Dwarf(characterName: choiceName()))
            case "5":
                print("Quel est le nom de votre archer ?")
                player.team.append(Archer(characterName: choiceName()))
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
    func teamInformation(player: Player) {
        print("Joueur: \(player.name)"
            + " \nL'équipe se compose de:")
        for i in 0...2 {
            print("Un \(player.team[i].type) nommé \(player.team[i].characterName) armé \(player.team[i].weapon.name) ayant \(player.team[i].health) points de vie.")
        }
        print("\n")
    }
    
    // Method which allows to choice a character in your team
    func choiceCharacter(player: Player) -> Character {
        
        for i in 0..<3 {
            print("\(i + 1)/ \(player.team[i].characterName) (vie: \(player.team[i].health)/\(player.team[i].healthMax), arme: \(player.team[i].weapon.name))")
        }
        
        if let choice = readLine() {
            if let index = Int(choice), player.team.indices.contains(index - 1) && player.team[index - 1].isAlive() {
                return player.team[index - 1]
            } else if let index = Int(choice), player.team.indices.contains(index - 1) && !player.team[index - 1].isAlive() {
                print("\(player.team[index - 1].characterName) est mort ! Choissisez un autre personnage.")
                return choiceCharacter(player: player)
            } else {
                print("Choix non-valide. Réessayez.")
                return choiceCharacter(player: player)
            }
        } else {
            return choiceCharacter(player: player)
        }
    }

    
    // Method which reprensents a round
    func round(player: Player, playerEnemy: Player) {
        var characterFighter: Character
        var characterTarget: Character
        
        print("\(player.name), quel personnage va attaquer l'ennemie ou soigner un allié ?")
        characterFighter = choiceCharacter(player: player)
        
        Chest().randomBoxRound(character: characterFighter)
        
        if characterFighter is Magus {
            print("Quel personnage va être soigné ?")
            characterTarget = choiceCharacter(player: player)
        } else {
            print("Quel personnage va être attaqué ?")
            characterTarget = choiceCharacter(player: playerEnemy)
        }
        
        characterFighter.attack(target: characterTarget)
        
        roundInformation(characterFighter: characterFighter, characterTarget: characterTarget)
    }
    
    
    func roundInformation(characterFighter: Character, characterTarget: Character) {
        
        if characterFighter is Magus {
            print("\(characterFighter.characterName) donne \(-characterFighter.weapon.damage) de vie à \(characterTarget.characterName). \n"
                + "\(characterTarget.characterName) a maintenant \(characterTarget.health) de vie. \n" )
        } else if characterFighter is Archer {
            print("\(characterFighter.characterName) décoche une flêche sur \(characterTarget.characterName). \n"
                + "\(characterTarget.characterName) a maintenant \(characterTarget.health) de vie. \n" )
        } else {
            print("\(characterFighter.characterName) inflige \(characterFighter.weapon.damage) de dégats à \(characterTarget.characterName). \n"
                + "\(characterTarget.characterName) a maintenant \(characterTarget.health) de vie. \n" )
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
        teamInformation(player: players[0])
        teamInformation(player: players[1])
    }
    
    
    // The logic of the game
    func newGame() {
        while players.count < 2 {
             createPlayer()
        }
        teamInformation(player: players[0])
        teamInformation(player: players[1])
        while players[0].isTeamAlive() && players[1].isTeamAlive() {
            round(player: players[0], playerEnemy: players[1])
            numberOfRounds += 1
            if players[0].isTeamAlive() && players[1].isTeamAlive() {
                round(player: players[1], playerEnemy: players[0])
                numberOfRounds += 1
            }
        }
        print("La partie est finie !")
        finalInformation()
    }
}
