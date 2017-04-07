//
//  ViewController.swift
//  Presidential Orders
//
//  Created by Steven Beckham on 3/28/17.
//  Copyright © 2017 GoldenTrophy. All rights reserved.
//

import UIKit

    var workingSet = NewSet() // Contains the four randomly selected presidents
    var displayScore = "" // Will contain the final score at the end of six rounds. Segued to GameOver.
    var learnMoreLink = "" // Contains the URL that will be segued to LearnMore view. Set when a president's name is tapped.
    var selectLink = "" // Informs the prepare() function which segue to perform

class ViewController: UIViewController {
    @IBOutlet weak var Field1: UILabel!
    @IBOutlet weak var Field2: UILabel!
    @IBOutlet weak var Field3: UILabel!
    @IBOutlet weak var Field4: UILabel!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var labelOneButton: UIButton!
    @IBOutlet weak var labelTwoButton: UIButton!
    @IBOutlet weak var labelThreeButton: UIButton!
    @IBOutlet weak var labelFourButton: UIButton!
    @IBOutlet weak var bottomNote: UILabel!

    // Keeping track of the score and current round
    var round = 1
    var score = 0
    
    // Breaks down workingSet() into a more readable format
    var president1 = workingSet.0
    var president2 = workingSet.1
    var president3 = workingSet.2
    var president4 = workingSet.3
    
    func setFieldText() {
        Field1.text = president1.name
        Field2.text = president2.name
        Field3.text = president3.name
        Field4.text = president4.name
    }
    
    func hideLabelButtons() {
        labelOneButton.isHidden = true
        labelTwoButton.isHidden = true
        labelThreeButton.isHidden = true
        labelFourButton.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timerPlay(self) // Start the timer
        bottomButton.isHidden = true // "Next Round" button is hidden
        setFieldText()
        hideLabelButtons()
        bottomNote.text = "Shake phone to check answers"
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
        
        bottomNote.text = "Tap a name to learn more"
        bottomButton.isHidden = false
        timerLabel.isHidden = true
        
        labelOneButton.isHidden = false
        labelTwoButton.isHidden = false
        labelThreeButton.isHidden = false
        labelFourButton.isHidden = false
        
        if checkAnswers() == true {
            bottomButton.setImage(#imageLiteral(resourceName: "next_round_success"), for: UIControlState.normal)
        }
        else {
            bottomButton.setImage(#imageLiteral(resourceName: "next_round_fail"), for: UIControlState.normal)
        }
    }
    
    
    
    // Bottom portion: Timer, Play Again, Score
    
    @IBAction func nextRound(_ sender: Any) {
        if round >= 6 {
            displayScore = "\(score) / \(round)"

            round = 1
            score = 0
            
            selectLink = "Game Over"
            
            self.performSegue(withIdentifier: "gameOverSegue", sender: sender)
        } else {
            // Reset everything for the next round and increment the round counter
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
            
            setFieldText()
            hideLabelButtons()
            
            bottomNote.text = "Shake phone to check answers"
        }

    }
    
    
    
    
    
    
    
    
    // Transfer score to second view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if selectLink == "Game Over" {
        let newView = segue.destination as! GameOver
        newView.text = displayScore
    } else if selectLink == "Learn More" {
        let learnMoreView = segue.destination as! LearnMore
        learnMoreView.learnMoreLink = learnMoreLink
    }
    }
    
    
    
    
    
    
    
    
    // Learn More Buttons
    @IBAction func learnMoreOne(_ sender: Any) {
        learnMoreLink = president1.learnMore
        selectLink = "Learn More"
        self.performSegue(withIdentifier: "labelOneSegue", sender: sender)
    }
    
    @IBAction func learnMoreTwo(_ sender: Any) {
        learnMoreLink = president2.learnMore
        selectLink = "Learn More"
        self.performSegue(withIdentifier: "labelTwoSegue", sender: sender)
    }
    
    @IBAction func learnMoreThree(_ sender: Any) {
        learnMoreLink = president3.learnMore
        selectLink = "Learn More"
        self.performSegue(withIdentifier: "labelThreeSegue", sender: sender)
    }
    
    @IBAction func learnMoreFour(_ sender: Any) {
        learnMoreLink = president4.learnMore
        selectLink = "Learn More"
        self.performSegue(withIdentifier: "labelFourSegue", sender: sender)
    }
    
    
    
    
    
    
    
    
    
    // Timer
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

