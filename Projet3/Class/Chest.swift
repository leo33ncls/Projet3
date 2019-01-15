//
//  Chest.swift
//  Projet3
//
//  Created by Léo NICOLAS on 11/01/2019.
//  Copyright © 2019 Léo NICOLAS. All rights reserved.
//

import Foundation

class Chest {
    
    func weapon() -> Weapon {
        let randomNumber = Int.random(in: 1...6)
        switch randomNumber {
        case 1: return Sword()
        case 2: return Axe()
        case 3: return Mace()
        case 4: return Trunk()
        case 5: return Lance()
        case 6: return Excalibur()
        default:
            return Sword()
        }
    }
    
    func magicWeapon() -> Weapon {
        let randomNumber = Int.random(in: 1...3)
        switch randomNumber {
        case 1: return Wand()
        case 2: return MagicStick()
        case 3: return Parchment()
        default:
            return Wand()
        }
    }
    
    func bows() -> Weapon {
        let randomNumber = Int.random(in: 1...3)
        switch randomNumber {
        case 1: return Bow()
        case 2: return GoldBow()
        case 3: return DamagedBow()
        default:
            return Bow()
        }
    }
    
    // Method which give a random weapon
    func randomWeapon(character: Character) {
        if character is Magus {
            character.weapon = magicWeapon()
            print("\(character.characterName) est maintenant équipé d'un(e) \(character.weapon.name) qui donne \(-(character.weapon.damage)) de vie. \n")
        } else if character is Archer{
            character.weapon = bows()
            print("\(character.characterName) est maintenant équipé d'un(e) \(character.weapon.name) \n")
        } else {
            character.weapon = weapon()
            print("\(character.characterName) est maintenant équipé d'un(e) \(character.weapon.name) qui inflige \(character.weapon.damage) de dégâts \n")
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
