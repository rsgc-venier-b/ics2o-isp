//
//  GameViewController.swift
//  RockPaperScissors
//
//  Created by Ben Venier on 2016-11-24.
//  Copyright © 2016 Ben Venier. All rights reserved.
//

import UIKit
import SpriteKit

enum Choice : Int {
    case rock
    case paper
    case scissors
}

class GameViewController: UIViewController {

    @IBOutlet weak var labelPlayerChoice: UILabel!
    
    @IBOutlet weak var computerImage: UIImageView!
    @IBOutlet weak var playerImage: UIImageView!
    
    // 0=Rock 1=Paper 2=Scissors
    var playerChoice = 0
    var computerChoice = 0
    
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
        playerChoice = Choice.rock.rawValue
        labelPlayerChoice.text = "Player 1 Chose: Rock"
        playerImage.image = UIImage(named: "rock")
    }
    
    @IBAction func chosePaper(_ sender: Any) {
        playerChoice = Choice.paper.rawValue
        labelPlayerChoice.text = "Player 1 Chose: Paper"
        playerImage.image = UIImage(named: "paper")
    }
    
    @IBAction func choseScissors(_ sender: Any) {
        
        playerChoice = Choice.scissors.rawValue
        labelPlayerChoice.text = "Player 1 Chose: Scissors"
        playerImage.image = UIImage(named: "scissors")
    }
    
    @IBAction func playRound(_ sender: Any) {
        
        computerChoice = Int(arc4random_uniform(3))
        print(computerChoice)
        
        // decide who won
        if computerChoice == Choice.rock.rawValue {
            
            if playerChoice == Choice.rock.rawValue {
                print("tie")
            } else if playerChoice == Choice.scissors.rawValue {
                print("Computer win, player loss")
            } else {
                print ("Computer loss, player win")
            }
             computerImage.image = UIImage(named: "rock")
            
            
        } else if computerChoice == Choice.paper.rawValue {
            
            if playerChoice == Choice.paper.rawValue {
                print("tie")
            } else if playerChoice == Choice.rock.rawValue {
                print("Computer win, player loss")
            } else {
                print("Computer loss, player win")
            }
            computerImage.image = UIImage(named: "paper")

            
        } else if computerChoice == Choice.scissors.rawValue {
            
            if playerChoice ==  Choice.scissors.rawValue {
                print("tie")
            } else if playerChoice == Choice.rock.rawValue {
                print("Computer loss, player win")
            } else {
                print("Computer win, player loss")
            }
            computerImage.image = UIImage(named: "scissors")

        }
    }
    
}
