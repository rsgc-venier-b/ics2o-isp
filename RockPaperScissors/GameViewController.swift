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

    // Outlets for labels and images
    
    @IBOutlet weak var labelPlayerChoice: UILabel!
    
    @IBOutlet weak var labelResult: UILabel!
    
    @IBOutlet weak var computerImage: UIImageView!
    @IBOutlet weak var playerImage: UIImageView!
    
    @IBOutlet weak var labelComputerWins: UILabel!
    @IBOutlet weak var labelPlayerWins: UILabel!
    
    
    // 0=Rock 1=Paper 2=Scissors
    
    var playerChoice = 0
    var computerChoice = 0
    var playerWins = 0
    var computerWins = 0
    
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
    
    // What happens when Rocl, Paper, Scissors buttons are pressed
    
    @IBAction func choseRock(_ sender: Any) {
        playerChoice = Choice.rock.rawValue
        labelPlayerChoice.text = "Player 1 Chose: Rock"
        playerImage.image = UIImage(named: "RockFlip")
    }
    
    @IBAction func chosePaper(_ sender: Any) {
        playerChoice = Choice.paper.rawValue
        labelPlayerChoice.text = "Player 1 Chose: Paper"
        playerImage.image = UIImage(named: "PaperFlip")
    }
    
    @IBAction func choseScissors(_ sender: Any) {
        
        playerChoice = Choice.scissors.rawValue
        labelPlayerChoice.text = "Player 1 Chose: Scissors"
        playerImage.image = UIImage(named: "ScissorsFlip")
    }
    
    // Everything that happens when go is clicked
    
    @IBAction func playRound(_ sender: Any) {
        
        computerChoice = Int(arc4random_uniform(3))
        print(computerChoice)
        
        // decide who won
        if computerChoice == Choice.rock.rawValue {
            
            if playerChoice == Choice.rock.rawValue {
                print("tie")
            labelResult.text = "Tie Game"
            } else if playerChoice == Choice.scissors.rawValue {
                print("Computer win, player loss")
                labelResult.text = "You Lose :("
                computerWins += 1
                labelComputerWins.text = String(computerWins)
            } else {
                print ("Computer loss, player win")
                labelResult.text = "You Win! :)"
                playerWins += 1
                labelPlayerWins.text = String(playerWins)
            }
             computerImage.image = UIImage(named: "rock")
            
            
        } else if computerChoice == Choice.paper.rawValue {
            
            if playerChoice == Choice.paper.rawValue {
                print("tie")
                labelResult.text = "Tie Game"
            } else if playerChoice == Choice.rock.rawValue {
                print("Computer win, player loss")
                computerWins += 1
                labelComputerWins.text = String(computerWins)
                labelResult.text = "You Lose:("
            } else {
                print("Computer loss, player win")
                labelResult.text = "You Win! :)"
                playerWins += 1
                labelPlayerWins.text = String(playerWins)
            }
            computerImage.image = UIImage(named: "paper")

            
        } else if computerChoice == Choice.scissors.rawValue {
            
            if playerChoice ==  Choice.scissors.rawValue {
                print("tie")
                labelResult.text = "Tie Game"
            } else if playerChoice == Choice.rock.rawValue {
                print("Computer loss, player win")
                playerWins += 1
                labelPlayerWins.text = String(playerWins)
                labelResult.text = "You Win! :)"
            } else {
                print("Computer win, player loss")
                computerWins += 1
                labelComputerWins.text = String(computerWins)
                labelResult.text = "You Lose:("
            }
            computerImage.image = UIImage(named: "scissors")

        }
        
    }
    
    // Resets game
    
    @IBAction func resetGame(_ sender: Any) {
        computerWins = 0
        playerWins = 0
        labelComputerWins.text = "Computer Wins: 0"
        labelPlayerWins.text = "Player Wins: 0"
        labelResult.text = "Result:"
        labelPlayerChoice.text = "Player 1 Chose:"
        playerImage.image = UIImage(named: "RockFlip")
        computerImage.image = UIImage(named: "rock")
    }
}
