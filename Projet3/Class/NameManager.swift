//
//  NameManager.swift
//  Projet3
//
//  Created by Léo NICOLAS on 11/01/2019.
//  Copyright © 2019 Léo NICOLAS. All rights reserved.
//

import Foundation

class NameManager {
    
    var nameArray = [String]()
    
    // Method to check if the name is valid
    func isNameValid(name: String) -> Bool {
        if name.count < 2 || nameArray.contains(name) {
            return false
        } else {
            return true
        }
    }
    
}
