//
//  ICarouselViewController.swift
//  swapMe
//
//  Created by Saif Jilani on 8/24/15.
//  Copyright (c) 2015 saifjilani. All rights reserved.
//

import UIKit

class ICarouselViewController: RootViewController, iCarouselDataSource, iCarouselDelegate
{
    var items = ["Bicycle1", "bicycle2", "chair", "chair2", "coffee maker", "comic_books", "couch", "dress", "dress2", "dress3", "dress4", "dress5", "easel", "easel2", "iphone holder", "Ipod_Classic"]
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
//        for i in 0...99
//        {
//            items.append(i)
//        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func numberOfItemsInCarousel(carousel: iCarousel!) -> Int
    {
        return items.count
    }
    
    func carousel(carousel:iCarousel!, viewForItemAtIndex index:Int, reusingView view:UIView!) -> UIView!
    {
//        var label: UILabel! = nil
        var newView = view
    
        //create new view if no view is available for recycling
        if (newView == nil)
        {
            //don't do anything specific to the index within
            //this `if (view == nil) {...}` statement because the view will be
            //recycled and used with other index values later
            newView = UIImageView(frame:CGRectMake(0, 0, 200, 200))
            newView.contentMode = .Redraw
    
        }
    
        //remember to always set any properties of your carousel item
        //views outside of the `if (view == nil) {...}` check otherwise
        //you'll get weird issues with carousel item content appearing
        //in the wrong place in the carousel
        (newView as! UIImageView!).image = UIImage(named: items[index])
    
        return newView
    }
    
    func carousel(carousel: iCarousel!, valueForOption option: iCarouselOption, withDefault value: CGFloat) -> CGFloat
    {
        if (option == .Spacing)
        {
            return value * 1.1
        }
        if (option == .Wrap)
        {
            return 1
        }
        return value
    }
}
