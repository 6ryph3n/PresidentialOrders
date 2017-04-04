//
//  ViewController.swift
//  Presidential Orders
//
//  Created by Steven Beckham on 3/28/17.
//  Copyright © 2017 GoldenTrophy. All rights reserved.
//

import UIKit

var workingSet = NewSet()
var president1 = workingSet.0
var president2 = workingSet.1
var president3 = workingSet.2
var president4 = workingSet.3

class ViewController: UIViewController {
    @IBOutlet weak var Field1: UILabel!
    @IBOutlet weak var Field2: UILabel!
    @IBOutlet weak var Field3: UILabel!
    @IBOutlet weak var Field4: UILabel!



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
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
    
    
    
    
    
    
    
    // Bottom portion: Timer, Play Again, Score
    
    @IBAction func playAgain(_ sender: Any) {
        workingSet = NewSet()
        
        Field1.text = workingSet.0.name
        Field2.text = workingSet.1.name
        Field3.text = workingSet.2.name
        Field4.text = workingSet.3.name
    }
        
    
}

