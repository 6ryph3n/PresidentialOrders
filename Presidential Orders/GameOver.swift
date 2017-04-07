//
//  GameOver.swift
//  Presidential Orders
//
//  Created by Steven Beckham on 4/4/17.
//  Copyright © 2017 GoldenTrophy. All rights reserved.
//

// This view is never actually dismissed. The "Play Again" button uses IB connections to segue directly back to ViewController

import UIKit
class GameOver: UIViewController {
    var text: String = "" // This creates a variable that will then be modified by the nextRound function in ViewController
    @IBOutlet weak var finalScore: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        finalScore.text = text // This displays the final score after six rounds. The variable is set by the nextRound function in ViewController
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
