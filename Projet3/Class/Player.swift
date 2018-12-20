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
    var name = ""
    var team = [Character]()
    var numberPlayer = 1
    
    
    // Methods
    
    // Method retrieving the player's name
    func playerName() {
        print("Quel est votre nom ?")
        if let choice = readLine() {
            name = choice
        }
    }
    
    // Method allowing to create a team of 3 characters with their name
    func choiceTeam() {
        while team.count < 3 {
            print("Choisissez un personnage"
                + " \n1 Le Guerrier"
                + " \n2 Le Mage"
                + " \n3 Le Colosse"
                + " \n4 Le nain")
            if let choice = readLine() {
                switch choice {
                case "1":
                    print("Quel est le nom de votre combattant ?")
                    var name = ""
                    if let choice = readLine() {
                        name = choice
                        team.append(Warrior(characterName: name))
                    }
                case "2":
                    print("Quel est le nom de votre mage ?")
                    var name = ""
                    if let choice = readLine() {
                        name = choice
                        team.append(Magus(characterName: name))
                    }
                case "3":
                    print("Quel est le nom de votre colosse ?")
                    var name = ""
                    if let choice = readLine() {
                        name = choice
                        team.append(Colossus(characterName: name))
                    }
                case "4":
                    print("Quel est le nom de votre nain ?")
                    var name = ""
                    if let choice = readLine() {
                        name = choice
                        team.append(Dwarf(characterName: name))
                    }
                default:
                    print("Je n'ai pas compris")
                }
            }
        }
        print("Votre équipe est complète, \(name).")
        print("Elle se compose de \(team[0].characterName),\(team[1].characterName), \(team[2].characterName) \n")
    }
    
    
}


