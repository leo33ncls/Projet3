//
//  Chest.swift
//  Projet3
//
//  Created by Léo NICOLAS on 11/01/2019.
//  Copyright © 2019 Léo NICOLAS. All rights reserved.
//

import Foundation

class Chest {
    
    var weaponBox = [Axe(), Sword(), Mace(), Trunk(), Lance(), Excalibur()]
    var magicWeaponBox = [Wand(), Parchment(), MagicStick()]
    
    // Method which give a random weapon
    func randomWeapon(character: Character) {
        if character is Magus || character is Wizard {
            let randomIndex = Int.random(in: 0...magicWeaponBox.count - 1)
            let newWeapon = magicWeaponBox[randomIndex]
            character.weapon = newWeapon
            print("\(character.characterName) est maintenant équipé d'un(e) \(newWeapon.name) qui donne \(-(newWeapon.damage)) de vie. \n")
        } else {
            let randomIndex = Int.random(in: 0...weaponBox.count - 1)
            let newWeapon = weaponBox[randomIndex]
            character.weapon = newWeapon
            print("\(character.characterName) est maintenant équipé d'un(e) \(newWeapon.name) qui inflige \(newWeapon.damage) de dégâts \n")
        }
    }
    
    // Method to make random the box's appearance
    func randomBoxRound(character: Character) {
        let randomNumber = Int.random(in: 0...4)
        if randomNumber == 1 {
            print("Un coffre vient d'apparaitre !")
            randomWeapon(character: character)
        } else {
            print("Aucun coffre à l'horizon. \n")
        }
    }
    
}
