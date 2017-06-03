//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Michael Solimini on 12/28/16.
//  Copyright © 2016 Alpha Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var PlayAgainBtn: UIButton!
    @IBOutlet weak var WinnerLbl: UILabel!
    var activePlayer = 1 //Cross
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var gameIsActive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   

    @IBAction func action(_ sender: Any) {
        
        if (gameState[(sender as AnyObject).tag-1] == 0) && gameIsActive == true{
            gameState[(sender as AnyObject).tag-1] = activePlayer
        if (activePlayer == 1) {
            (sender as AnyObject).setImage(UIImage(named: "Cross.png"), for: UIControlState())
            activePlayer = 2
        } else {
            (sender as AnyObject).setImage(UIImage(named: "Nought.png"), for: UIControlState())
            activePlayer = 1
        }
    }
        
        
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                gameIsActive = false
                if gameState[combination[0]] == 1 {
                   WinnerLbl.text = "Cross Has Won!"
                } else {
                    WinnerLbl.text = "O Has Won!"
                }
                PlayAgainBtn.isHidden = false;
                WinnerLbl.isHidden = false
            }
        }
        gameIsActive = false
        for i in gameState {
            if i == 0 {
                gameIsActive = true
                break
            }
        }
        if gameIsActive == false {
            WinnerLbl.text = "Draw"
            WinnerLbl.isHidden = false
            PlayAgainBtn.isHidden = false
        }
}
    @IBAction func PlayAgain(_ sender: Any) {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        
        PlayAgainBtn.isHidden = true
        WinnerLbl.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
   

}

