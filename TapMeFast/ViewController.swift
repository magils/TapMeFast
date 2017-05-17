//
//  ViewController.swift
//  TapMeFast
//
//  Created by Moises Gil on 5/16/17.
//  Copyright © 2017 Moises Gil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var tapMeButton: UIButton!
    @IBOutlet weak var starGameButton: UIButton!
    
    var timerCounter = 10;
    var gameTimer = Timer()
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.text = String(describing: timerCounter)
        scoreLabel.text = String(describing: score)
        
        tapMeButton.isEnabled = false
        tapMeButton.alpha = 0.5
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tap(_ sender: UIButton) {
        
        score += 1
        scoreLabel.text = String(score)
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        
        timerLabel.text = String(timerCounter) //Set the value of the timer before counting
        
        //This will start the game
        if timerCounter == 10 {
            
            starGameButton.setTitle("Start the game",for: []) // Restore the original title of the start button
            
            score = 0 // Restart the score
            scoreLabel.text = String(score) // Set the value of the score in the screen
            
            tapMeButton.isEnabled = true //Re-enable the button
            tapMeButton.alpha = 1 //Restore the transparency 
            
            starGameButton.isEnabled = false //Disable the button
            starGameButton.alpha = 0.5 // Set the alpha for disabled looking
            
            gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startCounter), userInfo: nil, repeats: true) //star counting
            
        }
        
        
        
    }
    
    
    func startCounter(){
        
        timerCounter -= 1
        timerLabel.text = String(timerCounter)
        
        
        //If the timer is equals to zero, then stop
        if timerCounter == 0 {
            
            gameTimer.invalidate()
            
            //Disable the tap me button
            tapMeButton.isEnabled = false
            tapMeButton.alpha = 0.5
            
            //Restart the start game button
            starGameButton.isEnabled = true
            starGameButton.alpha = 1
            
            starGameButton.setTitle("Restart", for: [])
            timerCounter = 10 //Restart the counting
        }
    }

}

