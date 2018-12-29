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
    var numberOfRounds = 1
    var weaponBox = [Axe(), Sword(), Mace(), Trunk(), Lance(), Excalibur()]
    var magicWeaponBox = [Wand(), Parchment(), MagicStick()]
    var characterFighter = Character(characterName: "", type: "", health: 0, healthMax: 0, weapon: Sword())
    var characterTarget = Character(characterName: "", type: "", health: 0, healthMax: 0, weapon: Sword())
    
    
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
                    continue
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
                print("⚠️ Nom trop court ou déjà utilisé. Choisissez un nouveau nom.")
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
                + " \n4 Le nain")
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
                    print("Je n'ai pas compris. \n")
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
    func choiceFighter(playerIndex: Int) {
        print("\(players[playerIndex].name), quel personnage va attaquer l'ennemie ou soigner un allié ?"
            + "\n1 \(players[playerIndex].team[0].characterName) (vie: \(players[playerIndex].team[0].health), dégats: \(players[playerIndex].team[0].weapon.damage))"
            + "\n2 \(players[playerIndex].team[1].characterName) (vie: \(players[playerIndex].team[1].health), dégats: \(players[playerIndex].team[1].weapon.damage))"
            + "\n3 \(players[playerIndex].team[2].characterName) (vie: \(players[playerIndex].team[2].health), dégats: \(players[playerIndex].team[2].weapon.damage))")
        if let choice = readLine() {
            switch choice {
            case "1":
                characterFighter = players[playerIndex].team[0]
            case "2":
                characterFighter = players[playerIndex].team[1]
            case "3":
                characterFighter = players[playerIndex].team[2]
            default:
                print("Je ne comprends pas. Veuillez réassayer. \n")
                choiceFighter(playerIndex: playerIndex)
            }
        }
        fighterIsAlive(characterFighter: characterFighter, playerIndex: playerIndex)
    }
    
    // Method allowing to choose an enemy character to attack
    func choiceTarget(playerIndex: Int, playerEnemyIndex: Int) {
        if characterFighter.weapon.damage < 0 {
            print("\(players[playerIndex].name), quel personnage va être soigner ?"
                + "\n1 \(players[playerIndex].team[0].characterName) (vie: \(players[playerIndex].team[0].health), arme: \(players[playerIndex].team[0].weapon.name))"
                + "\n2 \(players[playerIndex].team[1].characterName) (vie: \(players[playerIndex].team[1].health), arme: \(players[playerIndex].team[1].weapon.name))"
                + "\n3 \(players[playerIndex].team[2].characterName) (vie: \(players[playerIndex].team[2].health), arme: \(players[playerIndex].team[2].weapon.name))")
            if let choice = readLine() {
                switch choice {
                case "1":
                    characterTarget = players[playerIndex].team[0]
                case "2":
                    characterTarget = players[playerIndex].team[1]
                case "3":
                    characterTarget = players[playerIndex].team[2]
                default:
                    print("Je ne comprends pas. Veuillez ressayer. \n")
                    choiceTarget(playerIndex: playerIndex, playerEnemyIndex: playerEnemyIndex)
                }
            }
        } else {
            print("\(players[playerIndex].name), quelle est la cible ?"
                + "\n1 \(players[playerEnemyIndex].team[0].characterName) (vie: \(players[playerEnemyIndex].team[0].health), arme: \(players[playerEnemyIndex].team[0].weapon.name))"
                + "\n2 \(players[playerEnemyIndex].team[1].characterName) (vie: \(players[playerEnemyIndex].team[1].health), arme: \(players[playerEnemyIndex].team[1].weapon.name))"
                + "\n3 \(players[playerEnemyIndex].team[2].characterName) (vie: \(players[playerEnemyIndex].team[2].health), arme: \(players[playerEnemyIndex].team[2].weapon.name))")
            if let choice = readLine() {
                switch choice {
                case "1":
                    characterTarget = players[playerEnemyIndex].team[0]
                case "2":
                    characterTarget = players[playerEnemyIndex].team[1]
                case "3":
                    characterTarget = players[playerEnemyIndex].team[2]
                default:
                    print("Je ne comprends pas. Veuillez ressayer. \n")
                    choiceTarget(playerIndex: playerIndex, playerEnemyIndex: playerEnemyIndex)
                }
            }
        }
        targetIsAlive(characterTarget: characterTarget, playerIndex: playerIndex, playerEnemyIndex: playerEnemyIndex)
    }
    
    // Method which check if the characters involved in the fight are dead
    func fighterIsAlive(characterFighter: Character, playerIndex: Int) {
        if characterFighter.health <= 0 {
            print("\(characterFighter.characterName) est mort ! Il ne peut pas attaquer ! \n")
            choiceFighter(playerIndex: playerIndex)
        } else {
            print("")
        }
    }
    
    func targetIsAlive(characterTarget: Character, playerIndex: Int, playerEnemyIndex: Int) {
        if characterTarget.health <= 0 {
            print("\(characterTarget.characterName) est déjà mort ! Choisissez une autre cible. \n")
            choiceTarget(playerIndex: playerIndex, playerEnemyIndex: playerEnemyIndex)
        } else {
            print("")
        }
    }
    
    // Method which check if the team are still alive
    func isTeamAlive(indexPlayer: Int) -> Bool{
        var isTeamAlive: Bool
        if players[indexPlayer].team[0].health == 0 && players[indexPlayer].team[1].health == 0 && players[indexPlayer].team[2].health == 0 {
            isTeamAlive = false
        } else {
            isTeamAlive = true
        }
        return isTeamAlive
    }
    
    // Method which represents a round
    func round(playerIndex: Int, playerIndexEnemy: Int) {
        choiceFighter(playerIndex: playerIndex)
        randomBoxRound()
        choiceTarget(playerIndex: playerIndex, playerEnemyIndex: playerIndexEnemy)
        characterFighter.attack(target: characterTarget)
        if characterFighter.type == "Mage" {
            print("⛑ \(characterFighter.characterName) donne \(-(characterFighter.weapon.damage)) points de vie à \(characterTarget.characterName) \n")
        } else {
            print("⚔️ \(characterFighter.characterName) inflige \(characterFighter.weapon.damage) points de vie à \(characterTarget.characterName) \n")
        }
    }
    
    // Method which give a random weapon
    func randomWeapon() {
        if characterFighter.type == "Mage" {
            let randomIndex = Int(arc4random_uniform(UInt32(magicWeaponBox.count - 1)))
            let newWeapon = magicWeaponBox[randomIndex]
            characterFighter.weapon = newWeapon
            print("\(characterFighter.characterName) est maintenant équipé d'un(e) \(newWeapon.name) qui donne \(-(newWeapon.damage)) de vie. \n")
        } else {
            let randomIndex = Int(arc4random_uniform(UInt32(weaponBox.count - 1)))
            let newWeapon = weaponBox[randomIndex]
            characterFighter.weapon = newWeapon
            print("\(characterFighter.characterName) est maintenant équipé d'un(e) \(newWeapon.name) qui inflige \(newWeapon.damage) de dégâts \n")
        }
    }
    
    // Method to make random the box's appearance
    func randomBoxRound() {
        let arrayNumber = [1,2,3,4]
        let randomNumber = Int(arc4random_uniform(UInt32(arrayNumber.count)))
        if randomNumber == 1 {
            print("Un coffre vient d'apparaitre !")
            randomWeapon()
        } else {
            print("Aucun coffre à l'horizon. \n")
        }
    }
    // Method which gives de final statistics
    func finalInformation() {
        if isTeamAlive(indexPlayer: 0) == true {
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
        while isTeamAlive(indexPlayer: 0) == true && isTeamAlive(indexPlayer: 1) == true {
            round(playerIndex: 0, playerIndexEnemy: 1)
            numberOfRounds += 1
            if isTeamAlive(indexPlayer: 0) == true && isTeamAlive(indexPlayer: 1) == true {
                round(playerIndex: 1, playerIndexEnemy: 0)
                numberOfRounds += 1
            }
        }
        print("La partie est finie !")
        finalInformation()
    }
}
