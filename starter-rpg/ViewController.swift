//
//  ViewController.swift
//  starter-rpg
//
//  Created by Brenner Haverlock on 5/12/16.
//  Copyright © 2016 Doba Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var printLbl: UILabel!
    
    @IBOutlet var playerHPLabel: UILabel!
    
    @IBOutlet var enemyHPLabel: UILabel!
    
    @IBOutlet var enemyImg: UIImageView!
    
    @IBOutlet var chestBtn: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        player = Player(name: "Player 1", hp: 110, attackPwr: 20)
        
        generateRandomEnemy()
        
        playerHPLabel.text = "\(player.hp) HP"
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
        } else {
            enemy = EvilWizard(startingHp: 30, attackPwr: 8)
        }
        
        enemyImg.hidden = false
        enemyHPLabel.hidden = false 
        
    }
    
    @IBAction func onChestTapped(sender: AnyObject) {
        
        chestBtn.hidden = true
        printLbl.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats: false)
        
        
    }
    
    @IBAction func onAttackPressed(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHPLabel.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestBtn.hidden = false
            
        }
        
        if !enemy.isAlive {
            enemyHPLabel.text = ""
            printLbl.text = "Killed \(enemy.type)"
            enemyImg.hidden = true
        }
        
    }
    
    
    

}

