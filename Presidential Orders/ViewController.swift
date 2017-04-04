//
//  ViewController.swift
//  Presidential Orders
//
//  Created by Steven Beckham on 3/28/17.
//  Copyright © 2017 GoldenTrophy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Field1: UILabel!
    @IBOutlet weak var Field2: UILabel!
    @IBOutlet weak var Field3: UILabel!
    @IBOutlet weak var Field4: UILabel!
    var workingSet = NewSet()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Field1.text = workingSet.0.name
        Field2.text = workingSet.1.name
        Field3.text = workingSet.2.name
        Field4.text = workingSet.3.name
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Up and Down Buttons
    
    @IBAction func field1_down(_ sender: Any) {
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    // Bottom portion: Timer, Play Again, Score
    
    @IBAction func playAgain(_ sender: Any) {
        workingSet = NewSet()
        
        Field1.text = workingSet.0.name
        Field2.text = workingSet.1.name
        Field3.text = workingSet.2.name
        Field4.text = workingSet.3.name
    }
        
    
}

