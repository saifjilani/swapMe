//
//  MarketViewController.swift
//  swapMe
//
//  Created by Saif Jilani on 8/10/15.
//  Copyright (c) 2015 saifjilani. All rights reserved.
//

//ROOTVIEW CONTROLLER

import UIKit

class MarketViewController: ICarouselViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate, iCarouselDataSource, iCarouselDelegate

{
    @IBOutlet var carousel: iCarousel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Recognize swipes
        var upSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        var downSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        upSwipe.direction = .Up
        downSwipe.direction = .Down
        self.carousel.addGestureRecognizer(upSwipe)
        self.carousel.addGestureRecognizer(downSwipe)
        
        //Carousel Features
        carousel.bounces = true
        carousel.type = .CoverFlow2
        println("market loaded ")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //Parse login
        super.loginSetup()
    }

    @IBAction func performSegue(sender: AnyObject)
    {
        self.performSegueWithIdentifier("marketToInventorySegue", sender: self)
    }
    
    @IBAction func logOut(sender: AnyObject)
    {
        //Parse logout
        super.logoutAction()
    }
    
    //Handling swipes
    func handleSwipes(sender:UISwipeGestureRecognizer)
    {
        //Segue to inventory with up swipe
        if (sender.direction == .Up)
        {
            self.performSegueWithIdentifier("marketToInventorySegue", sender: sender)
        }
        //Delete image with down swipe
        if (sender.direction == .Down)
        {
            if (self.carousel.numberOfItems > 0)
            {
                var index = self.carousel.currentItemIndex
                self.items.removeAtIndex(index)
                self.carousel.removeItemAtIndex(index, animated: true)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

