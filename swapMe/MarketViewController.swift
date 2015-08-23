//
//  MarketViewController.swift
//  swapMe
//
//  Created by Saif Jilani on 8/10/15.
//  Copyright (c) 2015 saifjilani. All rights reserved.
//

//ROOTVIEW CONTROLLER

import UIKit

class MarketViewController: RootViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate

{
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        super.loginSetup()
    }

    @IBAction func performSegue(sender: AnyObject)
    {
        self.performSegueWithIdentifier("customSegue", sender: self)
    }
    
    @IBAction func logOut(sender: AnyObject)
    {
        super.logoutAction()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

