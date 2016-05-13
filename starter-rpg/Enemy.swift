//
//  Enemy .swift
//  starter-rpg
//
//  Created by Brenner Haverlock on 5/12/16.
//  Copyright © 2016 Doba Studios. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    var loot : [String] {
        return ["Rusty Dagger", "Toenail"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        
        return nil
    }
}