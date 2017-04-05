//
//  GameOver.swift
//  Presidential Orders
//
//  Created by Steven Beckham on 4/4/17.
//  Copyright © 2017 GoldenTrophy. All rights reserved.
//

import UIKit

class GameOver: UIViewController {
    @IBOutlet weak var finalScore: UILabel!
    var displayScore = "0"

    override func viewDidLoad() {
        super.viewDidLoad()
        finalScore.text = "Game Over. Your score is."
        // Do any additional setup after loading the view.
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
