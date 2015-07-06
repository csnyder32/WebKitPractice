//
//  ViewController.swift
//  WebKitPractice
//
//  Created by Chris Snyder on 7/6/15.
//  Copyright (c) 2015 LAKES. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        titleLabel.hidden = false
        titleLabel.backgroundColor = UIColor.blueColor()
        webView.delegate = self
    }

    override func viewDidAppear(animated: Bool) {
        var navBar = self.navigationController?.navigationBar
        navBar?.barStyle  = UIBarStyle.Black
        navBar?.tintColor = UIColor.yellowColor()
    }

    @IBAction func segmentButtonPressed(sender: AnyObject)
    {
        titleLabel.hidden = true

        switch segmentedControl.selectedSegmentIndex {
        case 0:
            if let url = NSURL(string: "http://www.espn.com"){
                let urlRequest = NSURLRequest(URL: url)
                webView.loadRequest(urlRequest)
            }
        case 1:
            if let urlTwo = NSURL(string: "http://www.yahoo.com"){
                let urlRequestTwo = NSURLRequest(URL: urlTwo)
                webView.loadRequest(urlRequestTwo)
            }
        case 2:
            if let urlThree = NSURL(string: "http://www.facebook.com"){
                let urlRequestThree = NSURLRequest(URL: urlThree)
                webView.loadRequest(urlRequestThree)
            }
        default:
            break
        }
    }

    //delegate metods - these two show the spinning cirlce at top of screen
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
}

