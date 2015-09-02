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
    @IBOutlet var hamburgerButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Hamburger navigation
        if self.revealViewController() != nil
        {
            hamburgerButton.target = self.revealViewController()
            hamburgerButton.action = "revealToggle:"
            //Might need to remove this because of icarousel
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        //Panning
        var panRecognizer = UIPanGestureRecognizer(target:self, action:"detectPan:")
        self.carousel.addGestureRecognizer(panRecognizer)
        
        

        //Carousel Features
        carousel.bounces = true
        carousel.type = .Cylinder
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //Parse login
        super.loginSetup()
    }


    @IBAction func logOut(sender: AnyObject)
    {
        //Parse logout
        super.logoutAction()
    }
    var originalLocation:CGPoint = CGPointMake(0, 0)
    
    //detect Pan
    // 150
    func detectPan(recognizer:UIPanGestureRecognizer)
    {
        
        var translation = recognizer.translationInView(self.carousel.currentItemView.superview!)
        self.carousel.currentItemView.center = CGPointMake(originalLocation.x + translation.x, originalLocation.y + translation.y)
        
        if (recognizer.state == UIGestureRecognizerState.Ended)
        {
            println("touches ended")
            //Snap item back if not moved enough
            if ((self.carousel.currentItemView.center.y > (-50)) && (self.carousel.currentItemView.center.y < 250))
            {
                self.carousel.currentItemView.center = originalLocation
            }
            //Otherwise delete it
            else
            {
                //func this
                if (self.carousel.numberOfItems > 0)
                {
                    var index = self.carousel.currentItemIndex
                    self.items.removeAtIndex(index)
                    self.carousel.removeItemAtIndex(index, animated: true)
                }
            }
            
        }
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        println("touches began")
        // Remember original location
        originalLocation = self.carousel.currentItemView.center
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func removeButton(sender: AnyObject)
    {
        //func
        if (self.carousel.numberOfItems > 0)
        {
            var index = self.carousel.currentItemIndex
            self.items.removeAtIndex(index)
            self.carousel.removeItemAtIndex(index, animated: true)
        }
    }
    
    @IBAction func inventoryButton(sender: AnyObject)
    {
        self.performSegueWithIdentifier("marketToInventorySegue", sender: sender)
    }
    
    @IBAction func likeButton(sender: AnyObject)
    {
        self.performSegueWithIdentifier("marketToInventorySegue", sender: sender)
    }
    
    
    
}

