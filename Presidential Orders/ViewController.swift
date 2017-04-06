//
//  ViewController.swift
//  Presidential Orders
//
//  Created by Steven Beckham on 3/28/17.
//  Copyright © 2017 GoldenTrophy. All rights reserved.
//

import UIKit

    var workingSet = NewSet()
    var displayScore = ""

class ViewController: UIViewController {
    @IBOutlet weak var Field1: UILabel!
    @IBOutlet weak var Field2: UILabel!
    @IBOutlet weak var Field3: UILabel!
    @IBOutlet weak var Field4: UILabel!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!

    var round = 1
    var score = 0
    var president1 = workingSet.0
    var president2 = workingSet.1
    var president3 = workingSet.2
    var president4 = workingSet.3

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timerPlay(self)
        bottomButton.isHidden = true
        Field1.text = president1.name
        Field2.text = president2.name
        Field3.text = president3.name
        Field4.text = president4.name
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Up and Down Buttons
    
    @IBAction func field1_down(_ sender: Any) {
        
        let transferPlaceholder = president2
        president2 = president1
        president1 = transferPlaceholder
        Field1.text = president1.name
        Field2.text = president2.name
    }
    
    @IBAction func field2_up(_ sender: Any) {
        let transferPlaceholder = president1
        president1 = president2
        president2 = transferPlaceholder
        Field1.text = president1.name
        Field2.text = president2.name
    }
    
    @IBAction func field2_down(_ sender: Any) {
        let transferPlaceholder = president3
        president3 = president2
        president2 = transferPlaceholder
        Field2.text = president2.name
        Field3.text = president3.name
    }
    
    @IBAction func field3_up(_ sender: Any) {
        let transferPlaceholder = president2
        president2 = president3
        president3 = transferPlaceholder
        Field2.text = president2.name
        Field3.text = president3.name
    }
    
    @IBAction func field3_down(_ sender: Any) {
        let transferPlaceholder = president4
        president4 = president3
        president3 = transferPlaceholder
        Field3.text = president3.name
        Field4.text = president4.name
    }
    
    @IBAction func field4_up(_ sender: Any) {
        let transferPlaceholder = president3
        president3 = president4
        president4 = transferPlaceholder
        Field3.text = president3.name
        Field4.text = president4.name
    }
    
    // Check answers
    func checkAnswers() -> Bool {
        var winLose: Bool
        
        if president1.inauguration < president2.inauguration && president2.inauguration < president3.inauguration && president3.inauguration < president4.inauguration {
            
            winLose = true
            score += 1
        } else {
            winLose = false
        }
        
        return winLose
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if checkAnswers() == true {
            bottomButton.setImage(#imageLiteral(resourceName: "next_round_success"), for: UIControlState.normal)
            bottomButton.isHidden = false
            timerLabel.isHidden = true
        }
        else {
            bottomButton.setImage(#imageLiteral(resourceName: "next_round_fail"), for: UIControlState.normal)
            bottomButton.isHidden = false
            timerLabel.isHidden = true
        }
    }
    
    
    
    // Bottom portion: Timer, Play Again, Score
    
    @IBAction func nextRound(_ sender: Any) {
        if round >= 6 {
            displayScore = "\(score) / \(round)"

            round = 1
            score = 0
            
            self.performSegue(withIdentifier: "gameOverSegue", sender: sender)
        } else {
            if timer.isValid {
                timer.invalidate()
            }
            time = 60
            timerLabel.isHidden = false
            timerPlay(self)
            workingSet = NewSet()
            round += 1
            bottomButton.isHidden = true
            president1 = workingSet.0
            president2 = workingSet.1
            president3 = workingSet.2
            president4 = workingSet.3
            
            Field1.text = president1.name
            Field2.text = president2.name
            Field3.text = president3.name
            Field4.text = president4.name
        }

    }
    
    // Transfer score to second view controller
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newView = segue.destination as! GameOver
        
        newView.text = displayScore
        
        
    }
    
    
    
    //// Timer
    
    var timer = Timer()
    var time = 60
    func decreaseTimer() {
        if time > 0 {
            time -= 1
            timerLabel.text = String(time)
        } else {
            timer.invalidate()
            timerLabel.isHidden = true
            if checkAnswers() == true {
                bottomButton.setImage(#imageLiteral(resourceName: "next_round_success"), for: UIControlState.normal)
                bottomButton.isHidden = false
            }
            else {
                bottomButton.setImage(#imageLiteral(resourceName: "next_round_fail"), for: UIControlState.normal)
                bottomButton.isHidden = false
            }
        }
    }
    
    @IBAction func timerPlay(_ sender: AnyObject) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTimer), userInfo: nil, repeats: true)
        
    }
    
}

