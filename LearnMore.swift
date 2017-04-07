//
//  LearnMore.swift
//  Presidential Orders
//
//  Created by Steven Beckham on 4/6/17.
//  Copyright © 2017 GoldenTrophy. All rights reserved.
//

import UIKit
import WebKit

class LearnMore: UIViewController {
    var webView: WKWebView!
    var learnMoreLink: String = "http://www.bing.com" // This variable is set by the learnMore buttons in ViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // This section creates a webView which displays the contents of the learnMoreLink variable.
        webView = WKWebView()
        view.addSubview(webView)
        let url: URL = URL(string: learnMoreLink)!
        let req: URLRequest = URLRequest(url: url)
        webView.load(req)
        
        // This section sets the auto-layout constraints for the above webView
        webView.translatesAutoresizingMaskIntoConstraints = false
        let width = NSLayoutConstraint(item: webView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0)
        let height = NSLayoutConstraint(item: webView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: -70)
        let top = NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 20)
        let bottom = NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 50)
        view.addConstraints([width, height, top, bottom])
    }

    // Dissmiss this view and go back to ViewController
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
