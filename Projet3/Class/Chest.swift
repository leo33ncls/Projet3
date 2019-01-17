//
//  Chest.swift
//  Projet3
//
//  Created by Léo NICOLAS on 11/01/2019.
//  Copyright © 2019 Léo NICOLAS. All rights reserved.
//

import Foundation

// class that represents a chest
class Chest {
    
    
    //======================
    // Methods
    
    // Method giving a random weapon
    private func weapon() -> Weapon {
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
    
    // Method giving a random magic weapon
    private func magicWeapon() -> Weapon {
        let randomNumber = Int.random(in: 1...3)
        switch randomNumber {
        case 1: return Wand()
        case 2: return MagicStick()
        case 3: return Parchment()
        default:
            return Wand()
        }
    }
    
    // Method giving a random bow
    private func bows() -> Weapon {
        let randomNumber = Int.random(in: 1...3)
        switch randomNumber {
        case 1: return Bow()
        case 2: return GoldBow()
        case 3: return DamagedBow()
        default:
            return Bow()
        }
    }
    
    // Method giving a random curse
    private func curses() -> Weapon {
        let randomNumber = Int.random(in: 1...3)
        switch randomNumber {
        case 1: return Curse()
        case 2: return WeakCurse()
        case 3: return StrongCurse()
        default:
            return Curse()
        }
    }
    
    
    // Method that assigns a weapon to a character
    func randomWeapon(character: Character) {
        if character is Magus {
            character.weapon = magicWeapon()
        } else if character is Archer{
            character.weapon = bows()
        } else if character is Wizard {
            character.weapon = curses()
        } else {
            character.weapon = weapon()
        }
    }
 
    
    // Method to make random the box's appearance
    func randomBoxRound() -> Bool {
        let randomNumber = Int.random(in: 1...5)
        if randomNumber == 1 {
            return true
        } else {
            return false
        }
    }
    
}
