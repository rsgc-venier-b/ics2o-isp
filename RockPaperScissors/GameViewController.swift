//
//  GameViewController.swift
//  RockPaperScissors
//
//  Created by Ben Venier on 2016-11-24.
//  Copyright © 2016 Ben Venier. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    @IBOutlet weak var labelPlayerChoice: UILabel!
    
    // 0=Rock 1=Paper 2=Scissors
    var playerChoice = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: CGSize(width: 2048, height: 1536))
        
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        

        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    @IBAction func choseRock(_ sender: Any) {
        playerChoice = 0
        labelPlayerChoice.text = "Player 1 Chose: Rock"
    }
    
    @IBAction func chosePaper(_ sender: Any) {
        playerChoice = 1
        labelPlayerChoice.text = "Player 1 Chose: Paper"
    }
    
    @IBAction func choseScissors(_ sender: Any) {
        
        playerChoice = 2
        labelPlayerChoice.text = "Player 1 Chose: Scissors"
    }
    
}
