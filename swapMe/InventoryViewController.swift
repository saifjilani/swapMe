//
//  InventoryViewController.swift
//  swapMe
//
//  Created by Saif Jilani on 8/15/15.
//  Copyright (c) 2015 saifjilani. All rights reserved.
//

import UIKit

class InventoryViewController: RootViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate
{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        super.loginSetup()
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


