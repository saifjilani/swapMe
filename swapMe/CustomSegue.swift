//
//  CustomSegue.swift
//  swapMe
//
//  Created by Saif Jilani on 8/12/15.
//  Copyright (c) 2015 saifjilani. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue
{
    
    override func perform()
    {
        let sourceVC: AnyObject = self.sourceViewController
        let destinationVC: AnyObject = self.destinationViewController
        
        sourceVC.view!!.addSubview(destinationVC.view!!)
        
        destinationVC.view!!.transform = CGAffineTransformMakeScale(0.05, 0.05)
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseInOut, animations: {() -> Void in
            
            destinationVC.view!!.transform = CGAffineTransformMakeScale(1.0, 1.0)
            
            
            }) { (finished) -> Void in
                
                destinationVC.view!!.removeFromSuperview()
                
                let time = dispatch_time(DISPATCH_TIME_NOW, Int64(0.001 * Double(NSEC_PER_SEC)))
                
                dispatch_after(time, dispatch_get_main_queue())
                {
                        sourceVC.presentViewController(destinationVC as! UIViewController, animated: false, completion: nil)
                }
        }
        
    }
}
