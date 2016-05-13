//
//  EvilWizard.swift
//  starter-rpg
//
//  Created by Brenner Haverlock on 5/12/16.
//  Copyright © 2016 Doba Studios. All rights reserved.
//

import Foundation

class EvilWizard: Enemy {
    
    override var loot: [String] {
        return ["Red orb staff", "Evil sphere of the nar", "Rare gold coin"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
    
}