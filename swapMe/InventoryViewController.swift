//
//  InventoryViewController.swift
//  swapMe
//
//  Created by Saif Jilani on 8/15/15.
//  Copyright (c) 2015 saifjilani. All rights reserved.
//

import UIKit

class InventoryViewController: ICarouselViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate, iCarouselDataSource, iCarouselDelegate
{
    
    @IBOutlet var hamburgerButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if self.revealViewController() != nil
        {
            hamburgerButton.target = self.revealViewController()
            hamburgerButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
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


