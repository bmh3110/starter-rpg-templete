//
//  Kimara.swift
//  starter-rpg
//
//  Created by Brenner Haverlock on 5/12/16.
//  Copyright © 2016 Doba Studios. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    
    let IMMUNE_MAX = 15
    
    override var loot: [String] {
        return ["Rare coin", "Touch hide", "Kimara Venom"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAttack(attackPwr)
        } else {
            return false 
        }
    }
    
}